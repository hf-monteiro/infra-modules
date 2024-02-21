# Define an AWS S3 bucket with environment-specific naming
resource "aws_s3_bucket" "private-bucket" {
    bucket = "${var.bucket-name}-${var.env}" # Construct bucket name using variables for name and environment
    tags = {
      "environment" = var.env  # Tag the bucket with the environment for easier resource management
  }
}

# Set the access control list (ACL) for the S3 bucket to private
resource "aws_s3_bucket_acl" "private-bucket-acl" {
    bucket = aws_s3_bucket.private-bucket.id # Reference the bucket by its ID
    acl = "private"  # Ensure the bucket content is only accessible based on explicit permissions
}
