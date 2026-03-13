# HuaweiCloud DMS Terraform Module

Terraform module which creates DMS (Distributed Message Service) resources on HuaweiCloud — supports both **Kafka** and **RabbitMQ** instances.

## Usage

### Kafka

```hcl
module "kafka" {
  source = "github.com/artifactsystems/terraform-huawei-dms?ref=v1.1.0"

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

### RabbitMQ

```hcl
module "rabbitmq" {
  source = "github.com/artifactsystems/terraform-huawei-dms?ref=v1.1.0"

  create_rabbitmq_instance = true
  create_kafka_instance    = false

  rabbitmq_name              = "my-rabbitmq-cluster"
  rabbitmq_engine_version    = "3.8.35"
  rabbitmq_flavor_id         = "rabbitmq.2u4g.cluster"
  rabbitmq_storage_spec_code = "dms.physical.storage.high.v2"
  rabbitmq_storage_space     = 300
  rabbitmq_broker_num        = 3

  rabbitmq_availability_zones = ["tr-west-1a", "tr-west-1b", "tr-west-1c"]
  rabbitmq_vpc_id             = "your-vpc-id"
  rabbitmq_network_id         = "your-subnet-id"
  rabbitmq_security_group_id  = "your-security-group-id"

  rabbitmq_access_user = "admin"
  rabbitmq_password    = "YourSecurePassword@123"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
```

## Features

### Kafka
- ✅ **Kafka Instance**: Create and manage Kafka clusters with flexible configurations
- ✅ **Multiple Engine Versions**: Support for Kafka 1.1.0, 2.3.0, 2.7, and other supported versions
- ✅ **Flexible Flavors**: Choose from various instance flavors (c6.2u4g, c6.4u8g, c6.8u16g, c6.16u32g)
- ✅ **Scalable Storage**: 300GB to 900,000GB storage capacity based on flavor
- ✅ **Multi-Broker Clusters**: Configure multiple brokers for high availability
- ✅ **SASL/SSL Authentication**: Secure access with username/password authentication
- ✅ **Security Protocols**: SASL_SSL (encrypted) or SASL_PLAINTEXT (plaintext with auth)
- ✅ **Public Access**: Internet access via EIP binding
- ✅ **Cross-VPC Access**: Enable access from other VPCs with advertised IP configuration
- ✅ **Port Protocol Configuration**: Fine-grained control over private/public access protocols
- ✅ **Custom Parameters**: Configure Kafka broker parameters

### RabbitMQ
- ✅ **RabbitMQ Instance**: Create and manage RabbitMQ clusters
- ✅ **Virtual Hosts (vhosts)**: Create and manage isolated virtual host environments
- ✅ **User Management**: Create users with per-vhost permissions (conf/write/read)
- ✅ **Plugin Management**: Enable RabbitMQ plugins (e.g. `rabbitmq_sharding`)
- ✅ **SSL Support**: Enable SSL for secure AMQP connections
- ✅ **ACL Support**: Enable ACL for AMQP-0-9-1 protocol
- ✅ **Public Access**: Internet access via single EIP binding

### Common
- ✅ **VPC Integration**: Deploy within your existing VPC and subnet
- ✅ **Multi-AZ Deployment**: Distribute brokers across Availability Zones (1 or 3+ AZs)
- ✅ **Maintenance Window**: Configurable maintenance schedules
- ✅ **Enterprise Project Integration**: Support for HuaweiCloud Enterprise Projects
- ✅ **Flexible Billing**: Pay-per-use (postPaid) or subscription (prePaid) modes
- ✅ **Tag Management**: Comprehensive tagging support

## Examples

- [basic](./examples/basic) - Basic Kafka cluster with SASL/SSL authentication and custom parameters
- [rabbitmq](./examples/rabbitmq) - Basic RabbitMQ cluster with VPC and security group

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
# Create only Kafka (default behaviour)
module "kafka" {
  source = "github.com/artifactsystems/terraform-huawei-dms?ref=v1.1.0"

  create                = true
  create_kafka_instance = true

  # ... other configuration
}

# Create only RabbitMQ
module "rabbitmq" {
  source = "github.com/artifactsystems/terraform-huawei-dms?ref=v1.1.0"

  create                   = true
  create_kafka_instance    = false
  create_rabbitmq_instance = true

  # ... other configuration
}
```

## Contributing

Report issues/questions/feature requests in the [issues](https://github.com/artifactsystems/terraform-huawei-dms/issues/new) section.

Full contributing [guidelines are covered here](.github/CONTRIBUTING.md).
