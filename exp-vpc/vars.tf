# Defines the deployment environment (e.g., prod, dev)
variable "env" {
    description = "The name of the environment, such as prod, dev, etc."
    type        = string
}

# Specifies the name to assign to the created VPC
variable "vpc-name" {
    description = "The name of the VPC."
    type        = string
}

# CIDR block to allocate for the entire VPC
variable "vpc-cidr" {
    description = "CIDR block for the VPC."
    type        = string
}

# Mapping of availability zones to numerical identifiers for public subnets
variable "public_subnet_numbers" {
    description = "Map of AZs to a number for creating public subnets."
    type        = map(number)
    default     = {
        "us-east-1a" = 1
        "us-east-1b" = 2
        "us-east-1c" = 3
    }
}

# Similar mapping for private subnets
variable "private_subnet_numbers" {
    description = "Map of AZs to a number for creating private subnets."
    type        = map(number)
    default     = {
        "us-east-1a" = 4
        "us-east-1b" = 5
        "us-east-1c" = 6
    }
}

# Mapping for subnets designated for Kubernetes (K8s) usage
variable "k8s-subnet-numbers" {
    description = "Map of AZs to a number for creating private subnets to use with K8s."
    type        = map(number)
    default     = {
        "us-east-1a" = 7
        "us-east-1b" = 8
        "us-east-1c" = 9
    }
}

# Name for an EKS cluster, relevant if deploying Kubernetes
variable "cluster-name" {
    description = "Name of the EKS cluster if it is going to be used for K8s."
    type        = string
    default     = ""
}

# Flag indicating if the infrastructure includes an EKS cluster
variable "k8s" {
    description = "Whether there will be an EKS cluster in this VPC."
    type        = bool
    default     = false
}
