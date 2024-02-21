### High Performance FIFO Queue

This document details the setup of a standard SQS FIFO queue designed for high performance, detailing necessary variables and outputs.

#### Variables

- **queue-name**: Mandatory. Specifies the name for the queue being established.
- **env**: Mandatory. Defines the environment in which the queue will be deployed.

#### Outputs

- **queue-arn**: Outputs the Amazon Resource Name (ARN) of the queue that was created.

## Requirements

There are no specific requirements for this setup.

## Providers

| Name | Version |
|------|---------|
| aws | Not specified |

## Modules

There are no modules used in this configuration.

## Resources

| Name | Type |
|------|------|
| aws_sqs_queue.hp-queue | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| env | The deployment environment of the queue. | `string` | None | Yes |
| queue-name | The name assigned to the queue. | `string` | None | Yes |

## Outputs

| Name | Description |
|------|-------------|
| queue-arn | The Amazon Resource Name (ARN) of the queue created. |
