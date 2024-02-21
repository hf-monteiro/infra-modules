# Output Variable: Bucket ARN
# This output variable returns the Amazon Resource Name (ARN) for the created S3 bucket.
# The ARN is a unique identifier that represents the bucket resource within AWS,
# allowing it to be referenced by other resources or applications.
output "bucket-arn" {
    value = aws_s3_bucket.private-bucket.arn
}
