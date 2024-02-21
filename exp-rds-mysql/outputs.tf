# Output: Cluster ID
# Description: This output variable returns the unique identifier of the created AWS RDS Cluster.
# The 'cluster-id' can be used to reference the RDS Cluster in other parts of your Terraform configuration or when querying the state information.
# It is particularly useful for automating the integration with other AWS services or Terraform modules that require the RDS Cluster ID as an input.
output "cluster-id" {
    value = aws_rds_cluster.mysql.id
}
