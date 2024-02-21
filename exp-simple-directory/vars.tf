# Variables for configuring AWS Directory Service

# Directory name
variable "name" {
    description = "Name of the directory to create."
    type = string
}

# Directory size
variable "size" {
    description = "The size of directory to create. Valid values are 'small' and 'large'."
    type = string
    default = "small"
}

# Directory edition
variable "edition" {
    description = "The directory edition to use. Valid values are 'standard' and 'premium'."
    type = string
    default = "standard"
}

# Domain name
variable "domain_name" {
    description = "The domain name for the directory."
    type = string
}

# Domain admin password
variable "password" {
    description = "The password to use for the domain service. It is recommended to use a secure method for managing the password."
    type = string
}

# VPC ID
variable "vpc_id" {
    description = "The VPC ID to create the directory in. The VPC must be configured with private subnets for directory communication."
    type = string
}

# Subnets
variable "subnets" {
    description = "The subnets to use for the directory. These should be private subnets to ensure secure communication within the VPC."
    type = list(string)
}
