# Output definition for Terraform configuration
# This output captures the unique identifier (ID) of the AWS DocumentDB cluster
# The `id` attribute is extracted from the `aws_docdb_cluster` resource named `docdb_cluster`
# It can be used for referencing the cluster in other configurations or API calls
output "cluster-id" {
  value = aws_docdb_cluster.docdb_cluster.id # Assigning the DocumentDB cluster's ID to the output
}
