# Define variables for configuring AWS SQS queue resources

# Name of the SQS queue
variable "queue-name" {
    type        = string
    description = "The name to be assigned to the SQS queue, which will be prefixed or suffixed with the environment name."
}

# Deployment environment
variable "env" {
    type        = string
    description = "The deployment environment for the SQS queue (e.g., dev, test, prod), used to differentiate resources in various environments."
}
