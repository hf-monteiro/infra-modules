### EXAMPLE-DOC-DB

This Terraform module provisions a DocumentDB cluster along with its instances tailored for specific environments.

#### Variables

- **service**: Required. Identifies the service associated with the DocumentDB cluster.
- **env**: _Optional_. Specifies the environment for the cluster deployment. Defaults to "dev".
- **db_subnet_group_name**: Required. Designates the database subnet groups for the cluster.
- **engine_version**: Required. Determines the DocumentDB engine version.
- **azs**: _Optional_. Lists the availability zones for cluster deployment. Defaults to ["us-east-1a", "us-east-1b", "us-east-1c"].
- **database-name**: _Optional_. Names the initial database. Defaults to "docdb".
- **master-user**: _Optional_. Names the master database user. Defaults to "docdb".
- **backup-period**: _Optional_. Sets the number of days for backup retention. Defaults to 7.
- **backup-window**: _Optional_. Schedules the backup window in UTC. Defaults to "00:00-03:00".
- **maintenance-window**: _Optional_. Schedules maintenance window in UTC. Defaults to "sun:03:00-sun:04:00".
- **security-groups**: Required. Specifies security groups for the cluster.
- **snapshot-mode**: _Optional_. Enables restoration from a snapshot. Defaults to false.
- **snapshot-id**: Required if **snapshot-mode** is true. Specifies the snapshot ID for restoration. Ineffective if snapshot-mode is false.
- **instance-class**: _Optional_. Chooses the instance class for cluster instances. Defaults to "db.t4g.medium".

#### Outputs

- **cluster_id**: Outputs the ID of the created DocumentDB cluster.

## Requirements

No specific requirements.

## Providers

| Name | Version |
|------|---------|
| aws | Not specified |

## Modules

No external modules used.

## Resources

Resources utilized include AWS DocumentDB cluster and cluster instance resources.

## Inputs and Outputs

Detailed descriptions and defaults for all inputs and outputs are provided, ensuring clear guidance for module usage.
