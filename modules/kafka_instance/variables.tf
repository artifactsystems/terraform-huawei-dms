################################################################################
# Basic Configuration
################################################################################

variable "region" {
  description = "The region in which to create the DMS Kafka instance"
  type        = string
  default     = null
}

variable "name" {
  description = "Specifies the name of the DMS Kafka instance"
  type        = string
  default     = null
}

variable "use_name_prefix" {
  description = "Whether to use name as a prefix"
  type        = bool
  default     = false
}

variable "description" {
  description = "Specifies the description of the DMS Kafka instance"
  type        = string
  default     = null
}

variable "engine_version" {
  description = "Specifies the version of the Kafka engine"
  type        = string
}

variable "flavor_id" {
  description = "Specifies the Kafka flavor ID"
  type        = string
  default     = null
}

variable "product_id" {
  description = "Specifies the product ID"
  type        = string
  default     = null
}

variable "storage_spec_code" {
  description = "Specifies the storage I/O specification"
  type        = string
}

variable "storage_space" {
  description = "Specifies the message storage capacity in GB"
  type        = number
  default     = null
}

variable "broker_num" {
  description = "Specifies the broker numbers"
  type        = number
  default     = null
}

variable "arch_type" {
  description = "Specifies the CPU architecture"
  type        = string
  default     = null
}

################################################################################
# Network Configuration
################################################################################

variable "vpc_id" {
  description = "Specifies the ID of the VPC"
  type        = string
}

variable "network_id" {
  description = "Specifies the ID of the subnet"
  type        = string
}

variable "security_group_id" {
  description = "Specifies the ID of the security group"
  type        = string
}

variable "availability_zones" {
  description = "The names of the AZ where the Kafka instances reside"
  type        = list(string)
}

variable "ipv6_enable" {
  description = "Specifies whether to enable IPv6"
  type        = bool
  default     = false
}

variable "new_tenant_ips" {
  description = "Specifies the IPv4 private IP addresses for the new brokers"
  type        = list(string)
  default     = null
}

################################################################################
# Authentication & Security
################################################################################

variable "ssl_enable" {
  description = "Specifies whether the Kafka SASL_SSL is enabled"
  type        = bool
  default     = false
}

variable "access_user" {
  description = "Specifies the username of SASL_SSL user"
  type        = string
  default     = null
}

variable "password" {
  description = "Specifies the password of SASL_SSL user"
  type        = string
  default     = null
  sensitive   = true
}

variable "security_protocol" {
  description = "Specifies the protocol to use after SASL is enabled"
  type        = string
  default     = null
}

variable "enabled_mechanisms" {
  description = "Specifies the authentication mechanisms to use after SASL is enabled"
  type        = list(string)
  default     = null
}

variable "vpc_client_plain" {
  description = "Specifies whether the intra-VPC plaintext access is enabled"
  type        = bool
  default     = false
}

################################################################################
# Public Access
################################################################################

variable "public_ip_ids" {
  description = "Specifies the IDs of the elastic IP addresses"
  type        = list(string)
  default     = null
}

################################################################################
# Cross-VPC Access
################################################################################

variable "cross_vpc_accesses" {
  description = "Specifies the cross-VPC access information"
  type = list(object({
    advertised_ip = optional(string)
  }))
  default = null
}

################################################################################
# Port Protocol Configuration
################################################################################

variable "port_protocol" {
  description = "Specifies the port protocol information"
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
# Maintenance & Operations
################################################################################

variable "maintain_begin" {
  description = "Specifies the time at which a maintenance time window starts"
  type        = string
  default     = null
}

variable "maintain_end" {
  description = "Specifies the time at which a maintenance time window ends"
  type        = string
  default     = null
}

variable "retention_policy" {
  description = "Specifies the action when the memory usage reaches the disk capacity threshold"
  type        = string
  default     = null
}

variable "enable_auto_topic" {
  description = "Specifies whether to enable automatic topic creation"
  type        = bool
  default     = false
}

variable "dumping" {
  description = "Specifies whether to enable message dumping (smart connect)"
  type        = bool
  default     = null
}

################################################################################
# Parameters
################################################################################

variable "parameters" {
  description = "Specifies the array of parameters to be set to the Kafka instance"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

################################################################################
# Enterprise & Billing
################################################################################

variable "enterprise_project_id" {
  description = "Specifies the enterprise project ID"
  type        = string
  default     = null
}

variable "charging_mode" {
  description = "Specifies the charging mode"
  type        = string
  default     = "postPaid"
}

variable "period_unit" {
  description = "Specifies the charging period unit"
  type        = string
  default     = null
}

variable "period" {
  description = "Specifies the charging period"
  type        = number
  default     = null
}

variable "auto_renew" {
  description = "Specifies whether auto renew is enabled"
  type        = string
  default     = null
}

################################################################################
# Tags & Timeouts
################################################################################

variable "tags" {
  description = "The key/value pairs to associate with the Kafka instance"
  type        = map(string)
  default     = {}
}

variable "timeouts" {
  description = "Terraform resource management timeouts"
  type = object({
    create = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = {}
}
