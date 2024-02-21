### MySQL

This module provisions an RDS MySQL-compatible Aurora cluster that aligns with current architectural and security benchmarks.

#### Variables

- **subnet-group**: Required. The ID of the subnet group where the RDS cluster will be provisioned.
- **service**: Required. Identifies the service utilizing the database.
- **env**: Required. Specifies the deployment environment.
- **engine-version**: Required. Determines the Aurora MySQL version to deploy.
- **database-name**: _Optional_. Sets the default database name. Defaults to "mysql-database".
- **master-user**: Required. Establishes the master (root) user's name.
- **master-pass**: Required. The master (root) user's password.~ Deprecated as of version 1.11.0.
- **security-group**: Required. The ID of the security group to link with the database cluster.
- **snapshot-mode**: _Optional_. Toggles database creation from an existing snapshot. Defaults to false.
- **snapshot-id**: _Required if **snapshot-mode** is true._ Specifies the snapshot ID for database creation. Irrelevant if **snapshot-mode** is false. Default: null.
- **instance-class**: _Optional_. The class of database instances to create. Defaults to db.t4g.medium.

#### Outputs

- **cluster-id**: The unique identifier of the created RDS cluster.
