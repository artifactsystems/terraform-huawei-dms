################################################################################
# General
################################################################################

variable "create" {
  description = "Whether to create DMS Kafka resources"
  type        = bool
  default     = true
}

variable "region" {
  description = "The region in which to create the DMS Kafka instance. If omitted, the provider-level region will be used"
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the Kafka instance"
  type        = map(string)
  default     = {}
}

################################################################################
# Kafka Instance - Basic Configuration
################################################################################

variable "create_kafka_instance" {
  description = "Whether to create a Kafka instance"
  type        = bool
  default     = true
}

variable "name" {
  description = "Specifies the name of the DMS Kafka instance. An instance name starts with a letter, consists of 4 to 64 characters, and supports only letters, digits, hyphens (-) and underscores (_)"
  type        = string
}

variable "use_name_prefix" {
  description = "Whether to use name as a prefix. If true, Terraform will generate a unique name"
  type        = bool
  default     = false
}

variable "description" {
  description = "Specifies the description of the DMS Kafka instance. It is a character string containing not more than 1,024 characters"
  type        = string
  default     = null
}

variable "engine_version" {
  description = "Specifies the version of the Kafka engine, such as 1.1.0, 2.3.0, 2.7 or other supported versions"
  type        = string
}

variable "flavor_id" {
  description = "Specifies the Kafka flavor ID, e.g. c6.2u4g.cluster. This parameter and product_id are alternative. It is recommended to use flavor_id"
  type        = string
  default     = null
}

variable "product_id" {
  description = "Specifies a product ID, which includes bandwidth, partition, broker and default storage capacity. This parameter and flavor_id are alternative"
  type        = string
  default     = null
}

variable "storage_spec_code" {
  description = <<-EOF
    Specifies the storage I/O specification.
    If the instance is created with flavor_id:
    - dms.physical.storage.high.v2: High I/O disk
    - dms.physical.storage.ultra.v2: Ultra-high I/O disk
    If the instance is created with product_id:
    - dms.physical.storage.high: High I/O (100MB, 300MB bandwidth)
    - dms.physical.storage.ultra: Ultra-high I/O (100MB, 300MB, 600MB, 1200MB bandwidth)
  EOF
  type        = string
}

variable "storage_space" {
  description = <<-EOF
    Specifies the message storage capacity in GB. Required when using flavor_id.
    - c6.2u4g.cluster (100MB bandwidth): 300 to 300,000 GB
    - c6.4u8g.cluster (300MB bandwidth): 300 to 600,000 GB
    - c6.8u16g.cluster (600MB bandwidth): 300 to 900,000 GB
    - c6.12u12g.cluster: 300 to 900,000 GB
    - c6.16u32g.cluster (1,200MB bandwidth): 300 to 900,000 GB
  EOF
  type        = number
  default     = null
}

variable "broker_num" {
  description = "Specifies the broker numbers. Required when creating an instance with flavor_id"
  type        = number
  default     = null
}

variable "arch_type" {
  description = "Specifies the CPU architecture. Valid value is X86"
  type        = string
  default     = null
}

################################################################################
# Kafka Instance - Network Configuration
################################################################################

variable "vpc_id" {
  description = "Specifies the ID of the VPC"
  type        = string
}

variable "network_id" {
  description = "Specifies the ID of the subnet (network)"
  type        = string
}

variable "security_group_id" {
  description = "Specifies the ID of the security group"
  type        = string
}

variable "availability_zones" {
  description = "The names of the AZ where the Kafka instances reside. Deploy one availability zone or at least three availability zones. Do not select two availability zones"
  type        = list(string)
}

variable "ipv6_enable" {
  description = "Specifies whether to enable IPv6. Defaults to false"
  type        = bool
  default     = false
}

variable "new_tenant_ips" {
  description = "Specifies the IPv4 private IP addresses for the new brokers. The number of specified IP addresses must be less than or equal to the number of new brokers"
  type        = list(string)
  default     = null
}

################################################################################
# Kafka Instance - Authentication & Security
################################################################################

variable "ssl_enable" {
  description = "Specifies whether the Kafka SASL_SSL is enabled. Defaults to false"
  type        = bool
  default     = false
}

variable "access_user" {
  description = "Specifies the username of SASL_SSL user. A username consists of 4 to 64 characters and supports only letters, digits, and hyphens (-). Required when ssl_enable is true"
  type        = string
  default     = null
}

variable "password" {
  description = "Specifies the password of SASL_SSL user. Must be 8 to 32 characters long with at least 2 character types. Required when ssl_enable is true"
  type        = string
  default     = null
  sensitive   = true
}

variable "security_protocol" {
  description = <<-EOF
    Specifies the protocol to use after SASL is enabled. Valid values:
    - SASL_SSL: Data is encrypted with SSL certificates for high-security transmission
    - SASL_PLAINTEXT: Data is transmitted in plaintext with username and password authentication
    Defaults to SASL_SSL
  EOF
  type        = string
  default     = null
}

variable "enabled_mechanisms" {
  description = <<-EOF
    Specifies the authentication mechanisms to use after SASL is enabled. Valid values:
    - PLAIN: Simple username and password verification
    - SCRAM-SHA-512: User credential verification, which is more secure than PLAIN
    Defaults to [PLAIN]
  EOF
  type        = list(string)
  default     = null
}

variable "vpc_client_plain" {
  description = "Specifies whether the intra-VPC plaintext access is enabled. Defaults to false"
  type        = bool
  default     = false
}

################################################################################
# Kafka Instance - Public Access
################################################################################

variable "public_ip_ids" {
  description = <<-EOF
    Specifies the IDs of the elastic IP addresses (EIP) bound to the DMS Kafka instance.
    If using flavor_id, total number of public IPs equals broker_num.
    If using product_id: 100MB/300MB=3, 600MB=4, 1200MB=8 IPs required
  EOF
  type        = list(string)
  default     = null
}

################################################################################
# Kafka Instance - Cross-VPC Access
################################################################################

variable "cross_vpc_accesses" {
  description = <<-EOF
    Specifies the cross-VPC access information.
    Example:
    [
      {
        advertised_ip = "192.168.0.100"
      }
    ]
  EOF
  type = list(object({
    advertised_ip = optional(string)
  }))
  default = null
}

################################################################################
# Kafka Instance - Port Protocol Configuration
################################################################################

variable "port_protocol" {
  description = <<-EOF
    Specifies the port protocol information for private/public access.
    Example:
    {
      private_plain_enable         = true
      private_sasl_ssl_enable      = false
      private_sasl_plaintext_enable = false
      public_plain_enable          = false
      public_sasl_ssl_enable       = false
      public_sasl_plaintext_enable = false
    }
    Note: private_sasl_ssl_enable and private_sasl_plaintext_enable cannot be true at the same time.
    Same rule applies for public access options.
  EOF
  type = object({
    private_plain_enable          = optional(bool)
    private_sasl_ssl_enable       = optional(bool)
    private_sasl_plaintext_enable = optional(bool)
    public_plain_enable           = optional(bool)
    public_sasl_ssl_enable        = optional(bool)
    public_sasl_plaintext_enable  = optional(bool)
  })
  default = null
}

################################################################################
# Kafka Instance - Maintenance & Operations
################################################################################

variable "maintain_begin" {
  description = "Specifies the time at which a maintenance time window starts. Format: HH:mm. Valid values: 22:00, 02:00, 06:00, 10:00, 14:00, or 18:00"
  type        = string
  default     = null
}

variable "maintain_end" {
  description = "Specifies the time at which a maintenance time window ends. Format: HH:mm. The end time is four hours later than the start time"
  type        = string
  default     = null
}

variable "retention_policy" {
  description = <<-EOF
    Specifies the action to be taken when the memory usage reaches the disk capacity threshold. Valid values:
    - time_base: Automatically delete the earliest messages
    - produce_reject: Stop producing new messages
  EOF
  type        = string
  default     = null
}

variable "enable_auto_topic" {
  description = "Specifies whether to enable automatic topic creation. If enabled, a topic will be automatically created with 3 partitions and 3 replicas when a message is produced to or consumed from a topic that does not exist. Defaults to false"
  type        = bool
  default     = false
}

variable "dumping" {
  description = "Specifies whether to enable message dumping (smart connect)"
  type        = bool
  default     = null
}

################################################################################
# Kafka Instance - Parameters
################################################################################

variable "parameters" {
  description = <<-EOF
    Specifies the array of parameters to be set to the Kafka instance after launched.
    Example:
    [
      {
        name  = "min.insync.replicas"
        value = "2"
      },
      {
        name  = "message.max.bytes"
        value = "10485760"
      }
    ]
    Note: Static parameters need instance restart to take effect.
  EOF
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

################################################################################
# Kafka Instance - Enterprise & Billing
################################################################################

variable "enterprise_project_id" {
  description = "Specifies the enterprise project ID of the Kafka instance"
  type        = string
  default     = null
}

variable "charging_mode" {
  description = "Specifies the charging mode of the instance. Valid values: prePaid, postPaid. Defaults to postPaid"
  type        = string
  default     = "postPaid"

  validation {
    condition     = contains(["prePaid", "postPaid"], var.charging_mode)
    error_message = "charging_mode must be either 'prePaid' or 'postPaid'."
  }
}

variable "period_unit" {
  description = "Specifies the charging period unit. Valid values: month, year. Required when charging_mode is prePaid"
  type        = string
  default     = null
}

variable "period" {
  description = "Specifies the charging period. If period_unit is month, value ranges from 1 to 9. If period_unit is year, value ranges from 1 to 3. Required when charging_mode is prePaid"
  type        = number
  default     = null
}

variable "auto_renew" {
  description = "Specifies whether auto renew is enabled. Valid values: true, false"
  type        = string
  default     = null
}

################################################################################
# Timeouts
################################################################################

variable "timeouts" {
  description = <<-EOF
    Terraform resource management timeouts for Kafka instance.
    Default values: create = 50m, update = 50m, delete = 15m
  EOF
  type = object({
    create = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = {}
}
