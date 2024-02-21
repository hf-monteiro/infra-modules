# Terraform Infrastructure Modules

## Overview

This repository contains vital components for establishing infrastructure in AWS environments. It acts as a dedicated repository of Terraform components, each crafted for different AWS services.

## How to

To deploy a component from this repository in your infrastructure environment, you must detail the repository URL, identify the correct component path, and declare the desired version in the `source` attribute of your component configuration. It is crucial to provide all necessary variables, as well as any additional ones that may be relevant to your particular setup. Please be advised that any alteration to components or upgrades to a subsequent version will necessitate a reinitialization process with `terraform init`.

### Usage Example

```hcl
module "vpc" {
    source        = "git@github.com:example/infra/infra-modules.git//exp-vpc?ref=tags/v1.3.1"
    env           = var.env
    vpc-cidr      = var.cidr
    vpc-name      = var.vpc-name
    cluster-name  = var.cluster-name
    k8s           = var.k8s
}
```