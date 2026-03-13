################################################################################
# General
################################################################################

variable "region" {
  description = "The region in which to create the DMS RabbitMQ instance"
  type        = string
  default     = null
}

################################################################################
# Basic Configuration
################################################################################

variable "name" {
  description = "Specifies the name of the DMS RabbitMQ instance"
  type        = string
  default     = null
}

variable "use_name_prefix" {
  description = "Whether to use name as a prefix"
  type        = bool
  default     = false
}

variable "description" {
  description = "Specifies the description of the DMS RabbitMQ instance"
  type        = string
  default     = null
}

variable "engine_version" {
  description = "Specifies the version of the RabbitMQ engine"
  type        = string
  default     = "3.8.35"
}

variable "flavor_id" {
  description = "Specifies the RabbitMQ flavor ID"
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
  description = "The names of the AZ where the RabbitMQ instances reside"
  type        = list(string)
}

################################################################################
# Authentication & Security
################################################################################

variable "access_user" {
  description = "Specifies the username for RabbitMQ access"
  type        = string
  default     = null
}

variable "password" {
  description = "Specifies the password for RabbitMQ access"
  type        = string
  default     = null
  sensitive   = true
}

variable "ssl_enable" {
  description = "Specifies whether SSL is enabled"
  type        = bool
  default     = false
}

variable "enable_acl" {
  description = "Specifies whether ACL is enabled. Only applicable to AMQP-0-9-1"
  type        = bool
  default     = null
}

################################################################################
# Public Access
################################################################################

variable "public_ip_id" {
  description = "Specifies the ID of the elastic IP address bound to the RabbitMQ instance"
  type        = string
  default     = null
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

################################################################################
# Vhosts
################################################################################

variable "vhosts" {
  description = "Specifies the set of vhost names to create on the RabbitMQ instance"
  type        = set(string)
  default     = []
}

################################################################################
# Users
################################################################################

variable "users" {
  description = <<-EOF
    Specifies the map of users to create on the RabbitMQ instance, keyed by access_key.
    Example:
    {
      "myuser" = {
        secret_key = "MySecret@123"
        vhosts = [
          {
            vhost = "/"
            conf  = ".*"
            write = ".*"
            read  = ".*"
          }
        ]
      }
    }
  EOF
  type = map(object({
    secret_key = string
    vhosts = list(object({
      vhost = string
      conf  = string
      write = string
      read  = string
    }))
  }))
  default = {}
}

################################################################################
# Plugins
################################################################################

variable "plugins" {
  description = "Specifies the list of plugin names to enable on the RabbitMQ instance"
  type        = list(string)
  default     = []
}

variable "plugin_timeouts" {
  description = <<-EOF
    Terraform resource management timeouts for RabbitMQ plugins.
    Default values: create = 50m, delete = 50m
  EOF
  type = object({
    create = optional(string)
    delete = optional(string)
  })
  default = {}
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
  description = "Specifies the charging mode. Valid values: prePaid, postPaid"
  type        = string
  default     = "postPaid"
}

variable "period_unit" {
  description = "Specifies the charging period unit. Valid values: month, year"
  type        = string
  default     = null
}

variable "period" {
  description = "Specifies the charging period"
  type        = number
  default     = null
}

variable "auto_renew" {
  description = "Specifies whether auto renew is enabled. Valid values: true, false"
  type        = string
  default     = null
}

################################################################################
# Tags & Timeouts
################################################################################

variable "tags" {
  description = "The key/value pairs to associate with the RabbitMQ instance"
  type        = map(string)
  default     = {}
}

variable "timeouts" {
  description = <<-EOF
    Terraform resource management timeouts for RabbitMQ instance.
    Default values: create = 50m, update = 50m, delete = 15m
  EOF
  type = object({
    create = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = {}
}
