# Basic DMS Kafka Instance

This directory contains a basic DMS (Distributed Message Service) Kafka instance configuration suitable for development or testing environments.

This example creates a Kafka cluster with SASL/SSL authentication enabled.

## Usage

To run this example, execute:

```bash
terraform init
terraform plan
terraform apply
```

**Note:** This example may create billable resources (Kafka instance, VPC, etc.). Run `terraform destroy` when you no longer need these resources.

## Configuration

This example creates:

- VPC and private subnet
- Security group with Kafka ports (9092, 9093)
- DMS Kafka instance with:
  - 3 brokers
  - SASL/SSL authentication enabled
  - Custom Kafka parameters (min.insync.replicas)

## Features Demonstrated

- **Flavor-based Sizing**: Using `flavor_id` for instance configuration
- **SASL/SSL Authentication**: Secure access with username/password
- **High I/O Storage**: Using high-performance storage specification
- **Kafka Parameters**: Custom broker configuration

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
| kafka | ../../ | n/a |
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
| kafka_instance_id | The Kafka instance ID |
| kafka_instance_name | The Kafka instance name |
| kafka_instance_status | The Kafka instance status |
| kafka_instance_connect_address | The Kafka instance connection address |
| kafka_instance_port | The Kafka instance port |
| kafka_instance_partition_num | The number of partitions |
| vpc_id | The VPC ID |
| security_group_id | The security group ID |
