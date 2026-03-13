# Basic DMS RabbitMQ Instance

This directory contains a basic DMS (Distributed Message Service) RabbitMQ instance configuration suitable for development or testing environments.

## Usage

To run this example, execute:

```bash
terraform init
terraform plan
terraform apply
```

**Note:** This example may create billable resources (RabbitMQ instance, VPC, etc.). Run `terraform destroy` when you no longer need these resources.

## Configuration

This example creates:

- VPC and private subnet
- Security group with RabbitMQ ports (5672, 5671, 15672)
- DMS RabbitMQ instance with:
  - 3 brokers across 3 Availability Zones
  - High I/O storage (300GB)
  - Admin user access

## Features Demonstrated

- **Flavor-based Sizing**: Using `flavor_id` for instance configuration
- **Multi-AZ Deployment**: Brokers distributed across 3 Availability Zones
- **High I/O Storage**: Using high-performance storage specification
- **Security Group**: Port rules for AMQP (5672), AMQP-SSL (5671), and management UI (15672)

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| huaweicloud | >= 1.79.0 |

## Providers

| Name | Version |
|------|---------|
| huaweicloud | >= 1.79.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| rabbitmq | ../../ | n/a |
| vpc | github.com/artifactsystems/terraform-huawei-vpc | v1.0.0 |
| security_group | github.com/artifactsystems/terraform-huawei-security-group | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| huaweicloud_availability_zones.available | data source |

## Inputs

This example does not require any inputs. All configuration is handled through locals in main.tf.

## Outputs

| Name | Description |
|------|-------------|
| rabbitmq_instance_id | The RabbitMQ instance ID |
| rabbitmq_instance_name | The RabbitMQ instance name |
| rabbitmq_instance_status | The RabbitMQ instance status |
| rabbitmq_connect_address | The RabbitMQ instance connection address |
| rabbitmq_management_address | The RabbitMQ management UI address |
| vpc_id | The VPC ID |
| security_group_id | The security group ID |
