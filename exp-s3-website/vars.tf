# Configuration variables for creating and managing an AWS S3 bucket with CORS and website configuration

# Unique bucket name required by AWS S3
variable "bucket_name" {
    type        = string
    description = "The name of the bucket to create. This must be globally unique."
}

# Environment the bucket is associated with (e.g., development, staging, production)
variable "env" {
    type        = string
    description = "This is the environment that the bucket is being created for."
}

# Headers allowed in CORS (Cross-Origin Resource Sharing) requests
variable "allowed_headers" {
    type        = list(string)
    description = "A list of headers that are allowed in CORS rules."
    default     = ["*"]
}

# HTTP methods allowed in CORS requests
variable "allowed_methods" {
    type        = list(string)
    description = "A list of methods that are allowed in CORS rules."
    default     = ["GET", "PUT", "POST"]
}

# Origins allowed to make CORS requests
variable "allowed_origins" {
    type        = list(string)
    description = "A list of origins that are allowed in CORS rules."
    default     = ["*"]
}

# Headers that browsers are allowed to access
variable "expose_headers" {
    type        = list(string)
    description = "A list of headers to expose."
    default     = ["ETag"]
}

# Duration in seconds the browser should cache the preflight response
variable "max_age" {
    type        = number
    description = "Time in seconds that your browser is to cache the preflight response for the specified resource."
    default     = 3000
}

# Index document for S3 bucket website hosting
variable "index" {
    type        = string
    description = "The index document for the website."
    default     = "index.html"
}

# Error document for S3 bucket website hosting
variable "error" {
    type        = string
    description = "The error document for the website."
    default     = "error.html"
}
