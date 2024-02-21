# Provision an AWS Directory Service directory for managing identities
resource "aws_directory_service_directory" "exp-directory" {
  name        = var.name        # The name of the directory
  size        = var.size        # The size of the directory (Small or Large)
  edition     = var.edition     # The edition of the directory (Standard or Enterprise)
  domain_name = var.domain_name # Fully qualified domain name for the directory
  password    = var.password    # Password for the directory administrator

  # VPC settings for hosting the directory service
  vpc_settings {
    vpc_id     = var.vpc_id    # ID of the VPC for the directory service
    subnet_ids = var.subnets   # Subnet IDs within the VPC for the directory
  }

  tags = {
    "environment" = var.env    # Tag the resource with the environment for easier management
  }
}
