### Postgres

This module provisions an RDS Postgres-compatible Aurora Database aligning with our architecture and security standards.

#### Variables

- **subnet-group**: Required. The ID of the subnet group where the database will be created.
- **service**: Required. Specifies the service this database is provisioned for.
- **env**: Required. Defines the environment (e.g., dev, staging, prod) for the database.
- **engine-version**: Required. Specifies the Aurora Postgres engine version.
- **database-name**: _Optional_. Names the primary database. Defaults to "postgres".
- **master-user**: Required. Sets the master (root) user's username.
- ~**master-pass**: Required. The master (root) user's password.~ Deprecated as of version 1.11.0.
- **security-group**: Required. The ID of the security group associated with the database.
- **snapshot-mode**: _Optional_. Enables database creation from a snapshot. Defaults to false.
- **snapshot-id**: _Required if snapshot-mode is true._ The snapshot ID for database creation. Irrelevant if snapshot-mode is false.
- **instance-class**: _Optional_. Determines the instance class. Defaults to "db.t4g.medium".

#### Outputs

- **cluster-id**: The ID of the created cluster.

## Requirements

No specific requirements.

## Providers

| Name | Version |
|------|---------|
| [aws](#provider_aws) | Not specified |

## Modules

No modules used.

## Resources

| Name | Type |
|------|------|
| [aws_rds_cluster.postgres](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster) | resource |
| [aws_rds_cluster_instance.exp-instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [database-name](#input_database-name) | The primary database name. | `string` | `"postgres"` | no |
| [engine-version](#input_engine-version) | Aurora Postgres engine version. | `string` | Not specified | yes |
| [env](#input_env) | Deployment environment. | `string` | `"lab"` | no |
| [instance-class](#input_instance-class) | Instance class for the database. | `string` | `"db.t4g.medium"` | no |
| [master-user](#input_master-user) | Username for the master user. | `string` | `"postgres"` | no |
| [security-group](#input_security-group) | Security group ID for the database. | `string` | Not specified | yes |
| [service](#input_service) | Service identifier. | `string` | Not specified | yes |
| [snapshot-id](#input_snapshot-id) | Snapshot ID for creating the database. | `string` | `null` | no |
| [snapshot-mode](#input_snapshot-mode) | Flag for snapshot-based database creation. | `bool` | `false` | no |
| [subnet-group](#input_subnet-group) | Subnet group ID for the database. | `string` | Not specified | yes |

## Outputs

| Name | Description |
|------|-------------|
| [cluster-id](#output_cluster-id) | The cluster ID of the provisioned database. |

