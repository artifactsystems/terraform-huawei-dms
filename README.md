# HuaweiCloud DMS Kafka Terraform Module

Terraform module which creates DMS (Distributed Message Service) Kafka instance on HuaweiCloud.

## Usage

```hcl
module "kafka" {
  source = "github.com/artifactsystems/terraform-huawei-dms?ref=v1.0.0"

  name              = "my-kafka-cluster"
  engine_version    = "2.7"
  flavor_id         = "kafka.2u4g.cluster.small"
  storage_spec_code = "dms.physical.storage.high.v2"
  storage_space     = 300
  broker_num        = 3

  availability_zones = ["tr-west-1a"]
  vpc_id             = "your-vpc-id"
  network_id         = "your-subnet-id"
  security_group_id  = "your-security-group-id"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
```

## Features

This module supports the following DMS Kafka features:

### Core Features
- ✅ **Kafka Instance**: Create and manage Kafka clusters with flexible configurations
- ✅ **Multiple Engine Versions**: Support for Kafka 1.1.0, 2.3.0, 2.7, and other supported versions
- ✅ **Flexible Flavors**: Choose from various instance flavors (c6.2u4g, c6.4u8g, c6.8u16g, c6.16u32g)
- ✅ **Scalable Storage**: 300GB to 900,000GB storage capacity based on flavor
- ✅ **Multi-Broker Clusters**: Configure multiple brokers for high availability

### Network Configuration
- ✅ **VPC Integration**: Deploy within your existing VPC and subnet
- ✅ **Multi-AZ Deployment**: Distribute brokers across Availability Zones (1 or 3+ AZs)
- ✅ **IPv6 Support**: Enable IPv6 networking for Kafka instances
- ✅ **Custom Broker IPs**: Specify private IP addresses for new brokers

### Authentication & Security
- ✅ **SASL/SSL Authentication**: Secure access with username/password authentication
- ✅ **Security Protocols**: SASL_SSL (encrypted) or SASL_PLAINTEXT (plaintext with auth)
- ✅ **Authentication Mechanisms**: PLAIN or SCRAM-SHA-512
- ✅ **VPC Client Plain Access**: Enable plaintext access within VPC

### Access Options
- ✅ **Public Access**: Internet access via EIP binding
- ✅ **Cross-VPC Access**: Enable access from other VPCs with advertised IP configuration
- ✅ **Port Protocol Configuration**: Fine-grained control over private/public access protocols

### Operations & Maintenance
- ✅ **Maintenance Window**: Configurable maintenance schedules
- ✅ **Retention Policy**: Automatic message deletion or produce rejection when full
- ✅ **Auto Topic Creation**: Automatically create topics on first message
- ✅ **Smart Connect (Dumping)**: Enable message dumping for data integration
- ✅ **Custom Parameters**: Configure Kafka broker parameters

### Enterprise & Billing
- ✅ **Enterprise Project Integration**: Support for HuaweiCloud Enterprise Projects
- ✅ **Flexible Billing**: Pay-per-use (postPaid) or subscription (prePaid) modes
- ✅ **Auto Renewal**: Automatic subscription renewal for prePaid instances
- ✅ **Tag Management**: Comprehensive tagging support

## Examples

- [basic](./examples/basic) - Basic Kafka cluster with SASL/SSL authentication and custom parameters

## Instance Sizing

### Flavor-based Configuration (Recommended)

Use `flavor_id` for more granular control over resources:

| Flavor ID | vCPU | Memory | Max Bandwidth | Storage Range |
|-----------|------|--------|---------------|---------------|
| `kafka.2u4g.cluster.small` | 2 | 4GB | 100MB/s | 300-300,000GB |
| `kafka.4u8g.cluster` | 4 | 8GB | 300MB/s | 300-600,000GB |
| `kafka.8u16g.cluster` | 8 | 16GB | 600MB/s | 300-900,000GB |
| `kafka.16u32g.cluster` | 16 | 32GB | 1,200MB/s | 300-900,000GB |

```hcl
module "kafka" {
  source = "github.com/artifactsystems/terraform-huawei-dms?ref=v1.0.0"

  name              = "high-performance-kafka"
  engine_version    = "2.7"
  flavor_id         = "kafka.8u16g.cluster"
  storage_spec_code = "dms.physical.storage.ultra.v2"  # Ultra-high I/O
  storage_space     = 1000
  broker_num        = 5

  # ... other configuration
}
```

### Storage Specification

| Storage Spec Code | Description | Use Case |
|-------------------|-------------|----------|
| `dms.physical.storage.high.v2` | High I/O | Standard workloads |
| `dms.physical.storage.ultra.v2` | Ultra-high I/O | High-throughput workloads |

## Authentication Configuration

### SASL/SSL (Recommended for Production)

```hcl
module "kafka" {
  source = "github.com/artifactsystems/terraform-huawei-dms?ref=v1.0.0"

  name           = "secure-kafka"
  engine_version = "2.7"

  ssl_enable        = true
  access_user       = "admin"
  password          = "YourSecurePassword@123"
  security_protocol = "SASL_SSL"           # Encrypted
  enabled_mechanisms = ["SCRAM-SHA-512"]   # More secure than PLAIN

  # ... other configuration
}
```

### Port Protocol Configuration

```hcl
module "kafka" {
  source = "github.com/artifactsystems/terraform-huawei-dms?ref=v1.0.0"

  name           = "multi-protocol-kafka"
  engine_version = "2.7"

  port_protocol = {
    private_plain_enable          = true   # Port 9092
    private_sasl_ssl_enable       = true   # Port 9093
    private_sasl_plaintext_enable = false
    public_plain_enable           = false
    public_sasl_ssl_enable        = false
    public_sasl_plaintext_enable  = false
  }

  # ... other configuration
}
```

## Public Access Configuration

### Enable Public Access with EIPs

```hcl
module "kafka" {
  source = "github.com/artifactsystems/terraform-huawei-dms?ref=v1.0.0"

  name       = "public-kafka"
  broker_num = 3

  # One EIP per broker
  public_ip_ids = [
    "eip-id-1",
    "eip-id-2",
    "eip-id-3"
  ]

  # ... other configuration
}
```

## Cross-VPC Access

```hcl
module "kafka" {
  source = "github.com/artifactsystems/terraform-huawei-dms?ref=v1.0.0"

  name = "cross-vpc-kafka"

  cross_vpc_accesses = [
    {
      advertised_ip = "192.168.0.100"
    },
    {
      advertised_ip = "192.168.0.101"
    }
  ]

  # ... other configuration
}
```

## Kafka Parameters

Configure Kafka broker parameters:

```hcl
module "kafka" {
  source = "github.com/artifactsystems/terraform-huawei-dms?ref=v1.0.0"

  name = "tuned-kafka"

  parameters = [
    {
      name  = "min.insync.replicas"
      value = "2"
    },
    {
      name  = "message.max.bytes"
      value = "10485760"  # 10MB
    },
    {
      name  = "log.retention.hours"
      value = "168"  # 7 days
    },
    {
      name  = "num.partitions"
      value = "3"
    }
  ]

  # ... other configuration
}
```

> **Note**: Some parameters are static and require an instance restart to take effect.

## Maintenance Configuration

```hcl
module "kafka" {
  source = "github.com/artifactsystems/terraform-huawei-dms?ref=v1.0.0"

  name = "maintained-kafka"

  maintain_begin = "02:00"  # Maintenance window start (UTC)
  maintain_end   = "06:00"  # Maintenance window end (4 hours later)

  retention_policy  = "time_base"     # or "produce_reject"
  enable_auto_topic = true            # Auto-create topics

  # ... other configuration
}
```

## High Availability

### Multi-AZ Deployment

Deploy across 3 Availability Zones for production:

```hcl
module "kafka" {
  source = "github.com/artifactsystems/terraform-huawei-dms?ref=v1.0.0"

  name       = "ha-kafka"
  broker_num = 6  # 2 brokers per AZ

  availability_zones = [
    "tr-west-1a",
    "tr-west-1b",
    "tr-west-1c"
  ]

  # Ensure replicas are in sync
  parameters = [
    {
      name  = "min.insync.replicas"
      value = "2"
    }
  ]

  # ... other configuration
}
```

> **Note**: Kafka requires 1 or 3+ Availability Zones. Do not use exactly 2 AZs.

## Conditional Creation

```hcl
module "kafka" {
  source = "github.com/artifactsystems/terraform-huawei-dms?ref=v1.0.0"

  create               = true   # Master toggle
  create_kafka_instance = true  # Toggle Kafka instance creation

  # ... other configuration
}
```

## Contributing

Report issues/questions/feature requests in the [issues](https://github.com/artifactsystems/terraform-huawei-dms/issues/new) section.

Full contributing [guidelines are covered here](.github/CONTRIBUTING.md).
