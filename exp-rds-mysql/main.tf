# Define an Amazon RDS cluster for Aurora MySQL
resource "aws_rds_cluster" "mysql" {
    db_subnet_group_name        = var.subnet_group          # Subnet group for the DB instances
    cluster_identifier          = "${var.service}-${var.env}" # Unique identifier for the cluster
    engine                      = "aurora-mysql"            # Database engine type
    engine_version              = var.engine_version        # Specific version of the database engine
    availability_zones          = ["us-east-1a", "us-east-1b", "us-east-1c"] # Specify AZs for high availability
    database_name               = var.database_name         # Name of the initial database created
    master_username             = var.master_user           # Master database user
    manage_master_user_password = true                      # Enables AWS to manage the master user password
    backup_retention_period     = 7                         # Number of days to retain backups
    preferred_backup_window     = "00:00-03:00"             # Preferred time window for DB backups
    preferred_maintenance_window= "sun:03:00-sun:04:00"     # Maintenance window for DB operations
    vpc_security_group_ids      = [var.security_group]      # VPC security groups for the cluster
    snapshot_identifier         = var.snapshot_mode == true ? var.snapshot_id : null # Restore from snapshot
    skip_final_snapshot         = true                      # Skip final snapshot upon cluster deletion
    tags                        = {"environment" = var.env} # Tags for resource management
}

# Define instances within the RDS cluster
resource "aws_rds_cluster_instance" "mysql-instance" {
    count               = var.env == "prod" ? 2 : 1          # Number of instances based on environment
    cluster_identifier  = aws_rds_cluster.mysql.id          # Reference to the associated RDS cluster
    instance_class      = var.instance_class                 # EC2 instance class for the DB instance
    engine              = aws_rds_cluster.mysql.engine       # Engine type, inheriting from the cluster
    engine_version      = aws_rds_cluster.mysql.engine_version # Engine version, inheriting from the cluster
    publicly_accessible = false                              # Control public accessibility
    db_subnet_group_name= var.subnet_group                   # Subnet group, inheriting from the cluster
    tags                = {"environment" = var.env}          # Tags for resource management
}

