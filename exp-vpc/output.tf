# Output the IDs of the public subnets created within the VPC.
# This can be useful for referencing these subnets in other parts of your Terraform configuration or for querying them with the Terraform output command.
output "public-subnets" {
    value = aws_subnet.public-subnets
}

# Output the IDs of the private subnets created within the VPC.
# Similar to the public subnets, these IDs can be used to reference the private subnets elsewhere in your Terraform configurations or when using the Terraform output command.
output "private-subnets" {
    value = aws_subnet.private-subnets
}

# Output the ID of the VPC created.
# This is useful for referencing the VPC in other Terraform configurations or when needing the VPC ID for certain AWS service configurations that require a VPC ID.
output "vpc" {
    value = aws_vpc.vpc
}

# Output the ID of the public route table associated with the public subnets.
# This can be useful for modifying the route table or for diagnostic purposes when troubleshooting network issues.
output "public-route-table" {
    value = aws_route_table.public-route-table
}

# Output the ID of the private route table associated with the private subnets.
# Like the public route table, this ID can be used for modifications or troubleshooting of the network routing for private subnets.
output "private-route-table" {
    value = aws_route_table.private-route-table
}
