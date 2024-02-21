# Define the AWS RDS cluster for PostgreSQL with basic configuration
resource "aws_rds_cluster" "postgres" {
    db_subnet_group_name         = var.subnet_group          # Associate with a DB subnet group for the VPC
    cluster_identifier           = "${var.service}-${var.env}" # Unique identifier combining service and environment
    engine                       = "aurora-postgresql"       # Specifies the database engine type
    engine_version               = var.engine_version        # Version of the database engine
    availability_zones           = ["us-east-1a", "us-east-1b", "us-east-1c"] # Specify AZs for deployment
    database_name                = var.database_name         # Name of the initial database
    master_username              = var.master_user           # Master database username
    manage_master_user_password  = true                      # AWS manages the master user password
    backup_retention_period      = 7                         # Number of days to retain backups
    preferred_backup_window      = "00:00-03:00"             # Schedule for database backups
    preferred_maintenance_window = "sun:03:00-sun:04:00"     # Schedule for maintenance window
    vpc_security_group_ids       = [var.security_group]      # Security groups for the cluster
    snapshot_identifier          = var.snapshot_mode == true ? var.snapshot_id : null # Restore from snapshot
    skip_final_snapshot          = true                      # Skip final snapshot upon deletion
    tags                         = {"environment" = var.env} # Environment tag for resource grouping
}

# Define instances within the RDS cluster
resource "aws_rds_cluster_instance" "exp-instance" {
    count               = var.env == "prod" ? 2 : 1           # Number of instances based on environment
    cluster_identifier  = aws_rds_cluster.postgres.id         # Link to the defined RDS cluster
    instance_class      = var.instance_class                  # Instance type
    engine              = aws_rds_cluster.postgres.engine     # Engine type, inherited from cluster
    engine_version      = aws_rds_cluster.postgres.engine_version # Engine version, inherited
    publicly_accessible = false                               # Network accessibility
    db_subnet_group_name= var.subnet_group                    # Subnet group for the instances
    tags                = {"environment" = var.env}           # Environment tag for resource grouping
}
