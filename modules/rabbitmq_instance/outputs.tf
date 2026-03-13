################################################################################
# Instance Information
################################################################################

output "id" {
  description = "The RabbitMQ instance ID"
  value       = huaweicloud_dms_rabbitmq_instance.this.id
}

output "name" {
  description = "The RabbitMQ instance name"
  value       = huaweicloud_dms_rabbitmq_instance.this.name
}

output "engine" {
  description = "The message engine type"
  value       = huaweicloud_dms_rabbitmq_instance.this.engine
}

output "engine_version" {
  description = "The RabbitMQ engine version"
  value       = huaweicloud_dms_rabbitmq_instance.this.engine_version
}

output "specification" {
  description = "The instance specification"
  value       = huaweicloud_dms_rabbitmq_instance.this.specification
}

output "type" {
  description = "The DMS RabbitMQ instance type"
  value       = huaweicloud_dms_rabbitmq_instance.this.type
}

output "status" {
  description = "The status of the RabbitMQ instance"
  value       = huaweicloud_dms_rabbitmq_instance.this.status
}

output "port" {
  description = "The port number of the RabbitMQ instance"
  value       = huaweicloud_dms_rabbitmq_instance.this.port
}

output "connect_address" {
  description = "The IP address of the RabbitMQ instance"
  value       = huaweicloud_dms_rabbitmq_instance.this.connect_address
}

output "management_connect_address" {
  description = "The management address of the RabbitMQ instance"
  value       = huaweicloud_dms_rabbitmq_instance.this.management_connect_address
}

output "enable_public_ip" {
  description = "Whether public access is enabled"
  value       = huaweicloud_dms_rabbitmq_instance.this.enable_public_ip
}

output "public_ip_address" {
  description = "The public IP address of the instance"
  value       = huaweicloud_dms_rabbitmq_instance.this.public_ip_address
}

output "resource_spec_code" {
  description = "The resource specifications identifier"
  value       = huaweicloud_dms_rabbitmq_instance.this.resource_spec_code
}

output "storage_space" {
  description = "The message storage capacity in GB"
  value       = huaweicloud_dms_rabbitmq_instance.this.storage_space
}

output "used_storage_space" {
  description = "The used message storage space in GB"
  value       = huaweicloud_dms_rabbitmq_instance.this.used_storage_space
}

output "extend_times" {
  description = "The extend times"
  value       = huaweicloud_dms_rabbitmq_instance.this.extend_times
}

output "is_logical_volume" {
  description = "Whether the instance is a new instance"
  value       = huaweicloud_dms_rabbitmq_instance.this.is_logical_volume
}

output "user_id" {
  description = "The ID of the user who created the RabbitMQ instance"
  value       = huaweicloud_dms_rabbitmq_instance.this.user_id
}

output "user_name" {
  description = "The name of the user who created the RabbitMQ instance"
  value       = huaweicloud_dms_rabbitmq_instance.this.user_name
}

output "created_at" {
  description = "The create time of the RabbitMQ instance"
  value       = huaweicloud_dms_rabbitmq_instance.this.created_at
}

output "charging_mode" {
  description = "The charging mode of the instance"
  value       = huaweicloud_dms_rabbitmq_instance.this.charging_mode
}

################################################################################
# Vhost Information
################################################################################

output "vhost_ids" {
  description = "A map of vhost name to vhost ID"
  value       = { for k, v in huaweicloud_dms_rabbitmq_vhost.this : k => v.id }
}

output "vhost_tracing" {
  description = "A map of vhost name to tracing enabled status"
  value       = { for k, v in huaweicloud_dms_rabbitmq_vhost.this : k => v.tracing }
}

################################################################################
# User Information
################################################################################

output "user_ids" {
  description = "A map of user access_key to user ID"
  value       = { for k, v in huaweicloud_dms_rabbitmq_user.this : k => v.id }
}

################################################################################
# Plugin Information
################################################################################

output "plugin_ids" {
  description = "A map of plugin name to plugin ID"
  value       = { for k, v in huaweicloud_dms_rabbitmq_plugin.this : k => v.id }
}

output "plugin_details" {
  description = "A map of plugin name to plugin details (enable, running, version)"
  value = {
    for k, v in huaweicloud_dms_rabbitmq_plugin.this : k => {
      enable  = v.enable
      running = v.running
      version = v.version
    }
  }
}
