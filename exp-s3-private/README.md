# Private Bucket

This Terraform module provisions a private S3 bucket suitable for various environments.

## Variables

- **bucket_name**: Mandatory. Specifies the unique name for the S3 bucket.
- **env**: Mandatory. Indicates the deployment environment (e.g., prod, dev) for the bucket.

## Outputs

- **bucket_arn**: Outputs the Amazon Resource Name (ARN) of the newly created S3 bucket.
