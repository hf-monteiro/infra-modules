# Create an S3 bucket with environment-specific naming
resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucket_name}-${var.env}" # Construct bucket name using provided variables
  tags = {
    "environment" = var.env # Tag bucket with environment for easier identification
  }
}

# Configure public access settings for the bucket
resource "aws_s3_bucket_public_access_block" "bucket-pab" {
  bucket = aws_s3_bucket.bucket.id # Reference the created bucket

  block_public_acls       = false # Controls blocking public ACLs
  block_public_policy     = false # Controls blocking public bucket policies
  ignore_public_acls      = false # Controls ignoring public ACLs on objects
  restrict_public_buckets = false # Controls restricting public bucket access
}

# Set ownership controls for objects in the bucket
resource "aws_s3_bucket_ownership_controls" "bucket-oc" {
  bucket = aws_s3_bucket.bucket.id # Reference the created bucket
  rule {
    object_ownership = "BucketOwnerPreferred" # Set preferred ownership model
  }
}

# Define the Access Control List (ACL) for the bucket
resource "aws_s3_bucket_acl" "bucket-acl" {
  depends_on = [
    aws_s3_bucket_public_access_block.bucket-pab,
    aws_s3_bucket_ownership_controls.bucket-oc,
  ] # Ensure public access block and ownership controls are set before ACL

  bucket = aws_s3_bucket.bucket.id # Reference the created bucket
  acl    = "public-read" # Set bucket ACL to public-read
}

# Configure Cross-Origin Resource Sharing (CORS) for the bucket
resource "aws_s3_bucket_cors_configuration" "bucket-cors" {
  bucket = aws_s3_bucket.bucket.id # Reference the created bucket

  cors_rule {
    allowed_headers = var.allowed_headers # Headers allowed in requests
    allowed_methods = var.allowed_methods # HTTP methods allowed
    allowed_origins = var.allowed_origins # Origins allowed to send requests
    expose_headers  = var.expose_headers # Headers exposed to the browser
    max_age_seconds = var.max_age # Time browser can cache the preflight response
  }
}

# Set up the bucket for website hosting
resource "aws_s3_bucket_website_configuration" "bucket-web" {
  bucket = aws_s3_bucket.bucket.id # Reference the created bucket

  index_document {
    suffix = var.index # Document to return for root URL
  }

  error_document {
    key = var.error # Document to return for errors
  }
}
