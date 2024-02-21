# Output the Directory ID of the created AWS Directory Service Directory
output "directory_id" {
    value = aws_directory_service_directory.exp-directory.directory_id
}

# Output the Access URL for the created AWS Directory Service Directory
output "directory_url" {
    value = aws_directory_service_directory.exp-directory.access_url
}
