# Variables for configuring PostgreSQL database infrastructure

# DB subnet group where the database will be created
variable "subnet-group" {
    type        = string
    description = "The DB subnet group name for the database."
}

# Service name for resource identification and tagging
variable "service" {
    type        = string
    description = "Service identifier for tagging and organizing resources."
}

# Environment where the database is deployed
variable "env" {
    type        = string
    default     = "lab"
    description = "Deployment environment (e.g., dev, staging, prod), defaults to 'lab'."
}

# Version of the PostgreSQL engine to use
variable "engine-version" {
    type        = string
    description = "The PostgreSQL engine version."
}

# Initial database name to be created
variable "database-name" {
    type        = string
    default     = "postgres"
    description = "Initial database name, defaults to 'postgres'."
}

# Security group associated with the database
variable "security-group" {
    type        = string
    description = "Security group ID for the database."
}

# Whether to create the database from a snapshot
variable "snapshot-mode" {
    type        = bool
    default     = false
    description = "Indicates if the database should be created from a snapshot."
}

# Snapshot ID used if creating the database from a snapshot
variable "snapshot-id" {
    type        = string
    default     = null
    description = "Snapshot ID for database creation, applicable if snapshot-mode is true."
}

# Class of the database instance
variable "instance-class" {
    type        = string
    default     = "db.t4g.medium"
    description = "The instance class for the database, defaults to 'db.t4g.medium'."
}

# Master user for the database
variable "master-user" {
  type        = string
  default     = "postgres"
  description = "Master username for the database, defaults to 'postgres'."
}
