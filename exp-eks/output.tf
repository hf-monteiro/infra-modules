# Output the name of the EKS cluster. This can be used to reference the cluster in other parts of your infrastructure setup or in external tools.
output "cluster-name" {
  value = aws_eks_cluster.eks-cluster.name
}

# Output the Amazon Resource Name (ARN) of the EKS cluster. This uniquely identifies the cluster within AWS and can be used for specifying cluster resources in IAM policies or other AWS services.
output "cluster-arn" {
  value = aws_eks_cluster.eks-cluster.arn
}

# Output the ARN of the IAM OIDC (OpenID Connect) provider associated with the EKS cluster. This is useful for setting up IAM roles for service accounts in Kubernetes.
output "oidc-arn" {
  value = aws_iam_openid_connect_provider.oid-provider.arn
}

# Output the URL of the IAM OIDC provider. This URL is used to configure OIDC identity federation, allowing for authentication with the EKS cluster via federated identities.
output "oidc-url" {
  value = aws_iam_openid_connect_provider.oid-provider.url
}

# Output the OIDC issuer URL for the EKS cluster. This URL is part of the OIDC discovery process and can be used to configure integrations with OIDC-compatible services.
output "eks-cert" {
  value = aws_eks_cluster.eks-cluster.identity[0].oidc[0].issuer
}

# Output the security group ID created for the EKS cluster. This security group is automatically created by EKS for the cluster and can be used to control access to the cluster nodes.
output "eks-sec-group-id" {
  value = aws_eks_cluster.eks-cluster.vpc_config[0].cluster_security_group_id
}
