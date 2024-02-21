# Output: Queue ARN
# This output variable returns the Amazon Resource Name (ARN) of the SQS queue named 'hp-queue'.
# The ARN is a unique identifier that is used to reference AWS resources across the platform,
# making it useful for integrating with other AWS services or for permission policies.
output "queue-arn" {
    value = aws_sqs_queue.hp-queue.arn
}
