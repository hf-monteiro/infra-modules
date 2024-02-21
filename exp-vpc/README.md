### Example VPC

This Terraform module provisions a Virtual Private Cloud (VPC) configured to align with current architectural and security benchmarks.

#### Variables

- **env**: (Required) Specifies the environment for which the VPC is intended.
- **vpc-name**: (Required) The designated name for the newly created VPC.
- **vpc-cidr**: (Required) The CIDR block that the VPC will utilize.
- **public_subnet_numbers**: (Optional) A map of availability zones to numerical identifiers for creating public subnets. **_NOTE: Alteration of this mapping is rarely necessary except for deployments in regions beyond us-east-1._** Defaults to:

```
    "us-east-1a" = 1
    "us-east-1b" = 2
    "us-east-1c" = 3
```

- **private_subnet_numbers**: (Optional) Similar to `public_subnet_numbers`, this maps AZs to numbers for private subnet creation. **_NOTE: Typically remains unchanged unless deploying outside us-east-1._** Defaults to:


```
    "us-east-1a" = 1
    "us-east-1b" = 2
    "us-east-1c" = 3
```

- **k8s-subnet-numbers**: (Optional) Maps AZs to numbers for subnet creation, relevant for Kubernetes deployments. **_NOTE: Customization is seldom needed unless operating outside us-east-1._** Defaults to:


```
    "us-east-1a" = 1
    "us-east-1b" = 2
    "us-east-1c" = 3
```

This parameter is disregarded if _k8s_ is set to false.

- **k8s**: (Optional) Indicates whether the VPC will host a Kubernetes cluster. Default is false.
- **cluster-name**: (Required if k8s is true) Names the Kubernetes cluster to be established within this VPC. Non-applicable if k8s is false.

#### Outputs

- **public-subnets**: Identifiers for the created public subnets.
- **private-subnets**: Identifiers for the created private subnets.
- **vpc**: The created VPC instance.
- **public-route-table**: Identifier for the public routing table.
- **private-route-table**: Identifier for the private routing table.
