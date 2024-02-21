# Define variables for configuring the database infrastructure with Terraform

# Subnet group for the database
variable "subnet-group" {
    type        = string
    description = "The name of the DB subnet group where the database should be created."
}

# Service name for resource tagging and identification
variable "service" {
    type        = string
    description = "Identifier for the service the database is associated with."
}

# Environment where the database will be deployed
variable "env" {
    type        = string
    default     = "lab"
    description = "Deployment environment (e.g., dev, staging, prod). Defaults to 'lab'."
}

# Database engine version
variable "engine-version" {
    type        = string
    description = "The version of the database engine to use."
}

# Initial database name to be created
variable "database-name" {
    type        = string
    default     = "mysql-database"
    description = "The name of the database to be created initially. Defaults to 'mysql-database'."
}

# Master username for the database
variable "master-user" {
    type        = string
    description = "The username for the database master user."
}

# Master password for the database
variable "master-pass" {
    type        = string
    description = "The password for the database master user."
}

# Security group for the database
variable "security-group" {
    type        = string
    description = "The ID of the security group to associate with the database."
}

# Flag to indicate if the database should be created from a snapshot
variable "snapshot-mode" {
    type        = bool
    default     = false
    description = "Whether to create the database from a snapshot. Defaults to false."
}

# Snapshot ID to use if creating the database from a snapshot
variable "snapshot-id" {
    type        = string
    default     = null
    description = "The ID of the snapshot to use for creating the database, if snapshot-mode is true."
}

# Instance class for the database
variable "instance-class" {
    type        = string
    default     = "db.t4g.medium"
    description = "The instance class to use for the database. Defaults to 'db.t4g.medium'."
}
