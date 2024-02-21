# Create a FIFO SQS queue with environment-specific naming and settings
resource "aws_sqs_queue" "hp-queue" {
    name                      = "${var.queue-name}-${var.env}.fifo" # Unique name for the queue, incorporating environment variable
    delay_seconds             = 0 # The time in seconds that the delivery of all messages in the queue is delayed
    max_message_size          = 2048 # Maximum message size in bytes
    message_retention_seconds = 345600 # Duration (in seconds) for which SQS retains a message
    receive_wait_time_seconds = 0 # The time for which a ReceiveMessage call will wait for a message to arrive
    fifo_queue                = true # Enables FIFO queue for ordered message delivery
    tags = {
      "environment" = var.env # Tag the resource with the environment for easier identification and management
    }
}
