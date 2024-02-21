# Output: S3 Bucket ARN
# Description: This output variable returns the Amazon Resource Name (ARN) of the S3 bucket created by Terraform.
# The ARN is a unique identifier for the S3 bucket and can be used to configure other AWS services or permissions that require the bucket's ARN.
output "bucket-arn" {
    value = aws_s3_bucket.bucket.arn  # Retrieves the ARN from the aws_s3_bucket resource named 'bucket'.
}
