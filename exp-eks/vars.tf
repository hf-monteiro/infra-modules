# Variables for configuring the EKS cluster and its worker nodes

# Subnets for the EKS cluster
variable "cluster_subnet_ids" {
    type        = list(string)
    description = "The list of subnets to use for the EKS cluster."
}

# Enable public access to the EKS cluster management
variable "public_access" {
    type        = bool
    description = "Whether or not to allow public access to cluster management."
    default     = false
}

# Enable private access to the EKS cluster management
variable "private_access" {
    type        = bool
    description = "Whether or not to allow private access to cluster management."
    default     = true
}

# CIDR blocks allowed public access to EKS cluster management
variable "public_cidrs" {
    type        = list(string)
    description = "Public CIDRs that are allowed to access cluster management. Only valid if public_access is true."
    default     = null
}

# Name of the EKS cluster
variable "cluster_name" {
    type        = string
    description = "Name of the EKS cluster to create."
    default     = "eks-cluster"
}

# Subnets for the worker nodes
variable "worker_subnet_ids" {
    type        = list(string)
    description = "List of subnets for the worker group in the cluster."
}

# Instance types for worker nodes
variable "worker_instance_types" {
    type        = list(string)
    description = "The types of instances that are allowed in the worker node group."
    default     = ["t3.2xlarge"]
}

# Desired number of worker nodes
variable "desired_size" {
    type        = string
    description = "The desired number of worker nodes."
    default     = "3"
}

# Minimum number of worker nodes
variable "min_size" {
    type        = string
    description = "The minimum number of worker nodes."
    default     = "1"
}

# Maximum number of worker nodes
variable "max_size" {
    type        = string
    description = "The maximum number of worker nodes."
    default     = "5"
}
