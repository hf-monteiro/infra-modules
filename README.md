# Reusable Infrastructure Modules

A collection of reusable Terraform modules for common AWS services. Each module is independently consumable and designed to be composed into larger environment configurations.

## Architecture

```mermaid
flowchart LR
    subgraph Networking
        VPC["exp-vpc\nVPC + IGW + DHCP"]
    end

    subgraph Compute
        EKS["exp-eks\nEKS Cluster\n+ Node Group\n+ OIDC + IAM Roles"]
    end

    subgraph Database
        PG["exp-rds-postgres\nAurora PostgreSQL\n+ Subnet Group"]
        MY["exp-rds-mysql\nAurora MySQL\n+ Subnet Group"]
        DOCDB["exp-doc-db\nDocumentDB Cluster\n+ Parameter Group"]
    end

    subgraph Storage
        S3P["exp-s3-private\nPrivate S3 Bucket\n+ Versioning + Encryption"]
        S3W["exp-s3-website\nS3 Static Website\n+ CloudFront"]
    end

    subgraph Messaging
        SQS["exp-high-perf-fifo-queue\nSQS FIFO Queue\n+ DLQ + KMS"]
    end

    subgraph Directory
        DIR["exp-simple-directory\nAWS Managed Simple AD"]
    end

    VPC --> EKS
    VPC --> PG
    VPC --> MY
    VPC --> DOCDB
    VPC --> DIR
```

## Available Modules

| Module | Description |
|--------|-------------|
| `exp-vpc` | VPC with Internet Gateway and DHCP options |
| `exp-eks` | EKS cluster with managed node group, OIDC provider, and IAM roles |
| `exp-rds-postgres` | Aurora PostgreSQL cluster with subnet group and parameter group |
| `exp-rds-mysql` | Aurora MySQL cluster with subnet group and parameter group |
| `exp-doc-db` | DocumentDB cluster with subnet group |
| `exp-s3-private` | Private S3 bucket with versioning, encryption, and bucket policy |
| `exp-s3-website` | S3 static website with CloudFront distribution |
| `exp-high-perf-fifo-queue` | High-throughput SQS FIFO queue with DLQ and KMS encryption |
| `exp-simple-directory` | AWS Managed Microsoft AD (Simple mode) |

## Usage

Reference a module from your Terraform configuration using the Git source:

```hcl
module "vpc" {
  source       = "git@github.com:hf-monteiro/infra-modules.git//exp-vpc?ref=tags/v1.0.0"
  env          = var.env
  vpc-cidr     = var.cidr
  vpc-name     = var.vpc-name
}

module "eks" {
  source       = "git@github.com:hf-monteiro/infra-modules.git//exp-eks?ref=tags/v1.0.0"
  cluster-name = var.cluster_name
  vpc-id       = module.vpc.vpc_id
  subnet-ids   = module.vpc.private_subnet_ids
}
```

After referencing a module or upgrading its version, reinitialize Terraform:

```shell
terraform init
terraform plan
terraform apply
```
