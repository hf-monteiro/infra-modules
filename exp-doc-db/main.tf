# Create an AWS DocumentDB cluster with configurable settings for scalability and security
resource "aws_docdb_cluster" "docdb_cluster" {
  cluster_identifier           = "${var.service}-${var.env}" # Unique identifier based on service and environment
  db_subnet_group_name         = var.db_subnet_group_name    # Subnet group for the cluster, for VPC placement
  engine                       = "docdb"                     # Specifies the use of DocumentDB engine
  engine_version               = var.engine_version          # Engine version for compatibility and features
  availability_zones           = var.azs                     # Availability zones for high availability
  database_name                = var.database_name           # Initial database name created upon cluster creation
  master_username              = var.master_user             # Username for the database master user
  manage_master_user_password  = true                        # Enables AWS to manage the master user password
  backup_retention_period      = var.backup_period           # Duration (in days) to retain backups
  preferred_backup_window      = var.backup_window           # Time window reserved for daily backups
  preferred_maintenance_window = var.maintenance_window      # Weekly maintenance time window
  vpc_security_group_ids       = var.security_groups         # Security groups to associate with the cluster
  snapshot_identifier          = var.snapshot_mode ? var.snapshot_id : null # Optional snapshot ID for restoration
  skip_final_snapshot          = true                        # Skips creation of final snapshot on deletion
  tags                         = {"environment" = var.env}   # Tag the cluster with the deployment environment
}

# Deploy instances within the DocumentDB cluster for database operations
resource "aws_docdb_cluster_instance" "docdb_instance" {
  count               = var.env == "prod" ? 2 : 1          # Conditionally deploy more instances for prod
  identifier          = "${var.service}-${var.env}-${count.index}" # Unique identifier for each instance
  cluster_identifier  = aws_docdb_cluster.docdb_cluster.id # Link instances to the DocumentDB cluster
  instance_class      = var.instance_class                 # Specify the class (size) of the instance
  tags                = {"environment" = var.env}          # Tag instances with the deployment environment
}
