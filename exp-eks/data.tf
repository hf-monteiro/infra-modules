data "tls_certificate" "eks-cert" {
    url = aws_eks_cluster.eks-cluster.identity[0].oidc[0].issuer
}