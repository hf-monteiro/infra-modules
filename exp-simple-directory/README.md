### Simple Directory Service Setup

This module provisions an AWS Simple Directory Service, suitable for integration with Amazon Workspaces and other AWS services that require directory services.

#### Configuration Variables

- **name**: (Required) Specifies the name for the directory.
- **size**: (Optional) Defines the size of the directory. Available options are `small` and `large`. Defaults to `small`.
- **edition**: (Optional) Determines the edition of the Simple Directory. Choose between `standard` and `premium`. Defaults to `standard`.
- **domain_name**: (Required) Sets the domain name for the directory.
- **password**: (Required) The administrator password for the directory.
- **vpc_id**: (Required) The VPC identifier where the directory will be deployed.
- **subnets**: (Required) List of subnet identifiers for the directory. **Important: Use private subnets only.**

#### Outputs

- **directory_id**: Identifier for the newly created directory.
- **directory_url**: Connection URL for accessing the directory.
