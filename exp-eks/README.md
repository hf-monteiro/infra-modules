### EXAMPLE EKS

This module deploys an EKS cluster and its associated resources, aligning with the latest architecture and security standards.

#### Variables

- **cluster_subnet_ids**: Required. Specifies the list of subnets for the EKS cluster.
- **public_access**: _Optional_. Determines if the cluster management is accessible externally from the VPC. Defaults to false.
- **private_access**: _Optional_. Determines if cluster management is accessible internally within the VPC. Defaults to true.
- **public_cidrs**: _Optional_. Defines CIDR ranges allowed external management access, effective only if **public_access** is enabled. Default is null.
- **cluster_name**: _Optional_. Names the EKS cluster. Default: "eks-cluster".
- **worker_subnet_ids**: Required. Identifies the subnets for worker nodes.
- **worker_instance_types**: _Optional_. Lists allowable instance types for worker nodes. Default: "t3.2xlarge".
- **desired_size**: _Optional_. Sets the desired number of worker nodes. Default: 3.
- **min_size**: _Optional_. Configures the minimum number of worker nodes. Default: 1.
- **max_size**: _Optional_. Specifies the maximum number of worker nodes. Default: 5.

#### Outputs

- **cluster-name**: The name of the created EKS cluster.
- **cluster-arn**: The Amazon Resource Name (ARN) for the created cluster.
- **oidc-arn**: The ARN for the OIDC provider associated with the EKS cluster.
- **oidc-url**: The URL for the OIDC provider associated with the EKS cluster.
- **eks-cert**: The certificate for the OIDC provider used by the EKS cluster.
- **eks-sec-group-id**: The ID of the security group associated with the EKS cluster.
