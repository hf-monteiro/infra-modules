# Define an IAM role for the EKS cluster to interact with AWS services
resource "aws_iam_role" "eks-iam-role-br" {
    name = "eks-iam-role-br"
    path = "/"
    # Policy that allows EKS to assume this role
    assume_role_policy = <<-EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": {
                    "Service": "eks.amazonaws.com"
                },
                "Action": "sts:AssumeRole"
            }
        ]
    }
    EOF
}

# Attach necessary policies for the EKS cluster role
resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role = aws_iam_role.eks-iam-role-br.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadeOnly-EKS" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    role = aws_iam_role.eks-iam-role-br.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKSVPCResourceController" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
    role = aws_iam_role.eks-iam-role-br.name
}

# Define the EKS cluster with basic configuration
resource "aws_eks_cluster" "eks-cluster" {
    name = "${var.cluster_name}"
    role_arn = aws_iam_role.eks-iam-role-br.arn

    # VPC configuration for the cluster
    vpc_config {
        subnet_ids = var.cluster_subnet_ids
        endpoint_public_access = var.public_access
        endpoint_private_access = var.private_access
        public_access_cidrs = var.public_cidrs
    }
    tags = {
      "environment" = var.env
  }

    depends_on = [
        aws_iam_role.eks-iam-role-br
    ]
}

# Define an IAM role for the worker nodes
resource "aws_iam_role" "workernodes" {
    name = "${var.cluster_name}-node-group"
    path = "/"
    assume_role_policy = <<-EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": {
                    "Service": "ec2.amazonaws.com"
                },
                "Action": "sts:AssumeRole"
            }
        ]
    }
    EOF
}

# Attach policies required for worker nodes to function correctly in an EKS cluster
resource "aws_iam_role_policy_attachment" "EKSWorkerNodePolicy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    role = aws_iam_role.workernodes.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKSCNIPolicy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    role = aws_iam_role.workernodes.name
}

resource "aws_iam_role_policy_attachment" "EC2InstanceProfileForImageBuilderECRContainerBuilds" {
    policy_arn = "arn:aws:iam::aws:policy/EC2InstanceProfileForImageBuilderECRContainerBuilds"
    role = aws_iam_role.workernodes.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    role = aws_iam_role.workernodes.name
}

# Define an EKS node group for the worker nodes
resource "aws_eks_node_group" "worker-node-group" {
    cluster_name = aws_eks_cluster.eks-cluster.name
    node_group_name = "${var.cluster_name}-workers"
    node_role_arn = aws_iam_role.workernodes.arn
    subnet_ids = var.worker_subnet_ids
    instance_types = "${var.worker_instance_types}"
    
    scaling_config {
        desired_size = "${var.desired_size}"
        max_size = "${var.max_size}"
        min_size = "${var.min_size}"
    }
    tags = {
      "environment" = var.env
  }

    depends_on = [
        aws_iam_role_policy_attachment.EKSWorkerNodePolicy,
        aws_iam_role_policy_attachment.AmazonEKSCNIPolicy,
        aws_iam_role_policy_attachment.EC2InstanceProfileForImageBuilderECRContainerBuilds,
        aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly
    ]
}
resource "aws_iam_openid_connect_provider" "oid-provider" {
    client_id_list = ["sts.amazonaws.com"]
    thumbprint_list = data.tls_certificate.eks-cert.certificates.*.sha1_fingerprint
    url = data.tls_certificate.eks-cert.url
}
