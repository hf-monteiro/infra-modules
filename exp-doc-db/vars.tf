# Variable definitions for configuring the AWS DocumentDB cluster Terraform module

# Service identifier to customize resources
variable "service" {
  type = string
}

# Environment (e.g., dev, prod) to enable different configurations per environment
variable "env" {
  type    = string
  default = "dev"
}

# Name of the DB subnet group for the DocumentDB cluster
variable "db_subnet_group_name" {
  type = string
}

# Engine version for the DocumentDB cluster
variable "engine-version" {
  type = string
}

# Availability zones where the DocumentDB cluster will be deployed
variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

# Default database name to be created within the DocumentDB cluster
variable "database-name" {
  type    = string
  default = "docdb"
}

# Username for the master user of the DocumentDB cluster
variable "master-user" {
  type    = string
  default = "docdb"
}

# Backup retention period for the DocumentDB cluster
variable "backup-period" {
  type    = number
  default = 7
}

# Preferred backup window for the DocumentDB cluster
variable "backup-window" {
  type    = string
  default = "00:00-03:00"
}

# Preferred maintenance window for the DocumentDB cluster
variable "maintenance-window" {
  type    = string
  default = "sun:03:00-sun:04:00"
}

# Security groups to be associated with the DocumentDB cluster
variable "security-groups" {
  type = list(string)
}

# Flag to indicate if the cluster should be created from a snapshot
variable "snapshot-mode" {
  type    = bool
  default = false
}

# Snapshot ID from which to restore the DocumentDB cluster, if snapshot-mode is true
variable "snapshot-id" {
  type    = string
  default = null
}

# Instance class for the DocumentDB cluster instances
variable "instance-class" {
  type    = string
  default = "db.t4g.medium"
}
