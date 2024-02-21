# Variable for the base name of the S3 bucket to be created
variable "bucket-name" {
    type        = string
    description = "The base name of the S3 bucket. Actual name will be constructed using the environment variable."
}

# Environment variable to append to the bucket name for uniqueness
variable "env" {
    type        = string
    description = "The deployment environment (e.g., dev, staging, prod) used to construct the full bucket name."
}
