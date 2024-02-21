# Output: RDS Cluster ID
# This output variable returns the ID of the AWS RDS cluster named 'postgres'.
# Use this ID to reference the cluster in other configurations or for querying its attributes in external tools or scripts.
output "cluster-id" {
    value = aws_rds_cluster.postgres.id
}
