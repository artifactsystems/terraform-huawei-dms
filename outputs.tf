################################################################################
# Kafka Instance - Basic Information
################################################################################

output "kafka_instance_id" {
  description = "The Kafka instance ID"
  value       = try(module.kafka_instance[0].id, null)
}

output "kafka_instance_name" {
  description = "The Kafka instance name"
  value       = try(module.kafka_instance[0].name, null)
}

output "kafka_instance_status" {
  description = "The status of the Kafka instance"
  value       = try(module.kafka_instance[0].status, null)
}

output "kafka_instance_engine" {
  description = "The message engine type"
  value       = try(module.kafka_instance[0].engine, null)
}

output "kafka_instance_engine_version" {
  description = "The Kafka engine version"
  value       = try(module.kafka_instance[0].engine_version, null)
}

output "kafka_instance_type" {
  description = "The DMS Kafka instance type"
  value       = try(module.kafka_instance[0].type, null)
}

################################################################################
# Kafka Instance - Network Information
################################################################################

output "kafka_instance_port" {
  description = "The port number of the Kafka instance"
  value       = try(module.kafka_instance[0].port, null)
}

output "kafka_instance_connect_address" {
  description = "The IP address of the Kafka instance"
  value       = try(module.kafka_instance[0].connect_address, null)
}

output "kafka_instance_pod_connect_address" {
  description = "The connection address on the tenant side"
  value       = try(module.kafka_instance[0].pod_connect_address, null)
}

output "kafka_instance_ipv6_connect_addresses" {
  description = "The IPv6 connect addresses list"
  value       = try(module.kafka_instance[0].ipv6_connect_addresses, null)
}

output "kafka_instance_cross_vpc_accesses" {
  description = "The cross-VPC access information"
  value       = try(module.kafka_instance[0].cross_vpc_accesses, null)
}

################################################################################
# Kafka Instance - Public Access
################################################################################

output "kafka_instance_enable_public_ip" {
  description = "Whether public access to the Kafka instance is enabled"
  value       = try(module.kafka_instance[0].enable_public_ip, null)
}

output "kafka_instance_public_ip_address" {
  description = "The public IP addresses list of the instance"
  value       = try(module.kafka_instance[0].public_ip_address, null)
}

output "kafka_instance_public_bandwidth" {
  description = "The public network access bandwidth"
  value       = try(module.kafka_instance[0].public_bandwidth, null)
}

################################################################################
# Kafka Instance - Storage Information
################################################################################

output "kafka_instance_storage_space" {
  description = "The message storage capacity in GB"
  value       = try(module.kafka_instance[0].storage_space, null)
}

output "kafka_instance_used_storage_space" {
  description = "The used message storage space in GB"
  value       = try(module.kafka_instance[0].used_storage_space, null)
}

output "kafka_instance_storage_type" {
  description = "The storage type"
  value       = try(module.kafka_instance[0].storage_type, null)
}

output "kafka_instance_storage_resource_id" {
  description = "The storage resource ID"
  value       = try(module.kafka_instance[0].storage_resource_id, null)
}

output "kafka_instance_extend_times" {
  description = "The extend times. If the value exceeds 20, disk expansion is no longer allowed"
  value       = try(module.kafka_instance[0].extend_times, null)
}

################################################################################
# Kafka Instance - Cluster Information
################################################################################

output "kafka_instance_partition_num" {
  description = "The number of partitions in Kafka instance"
  value       = try(module.kafka_instance[0].partition_num, null)
}

output "kafka_instance_broker_num" {
  description = "The number of brokers"
  value       = try(module.kafka_instance[0].broker_num, null)
}

output "kafka_instance_node_num" {
  description = "The node quantity"
  value       = try(module.kafka_instance[0].node_num, null)
}

output "kafka_instance_resource_spec_code" {
  description = "The resource specifications identifier"
  value       = try(module.kafka_instance[0].resource_spec_code, null)
}

################################################################################
# Kafka Instance - Connector Information
################################################################################

output "kafka_instance_connector_id" {
  description = "The connector ID (for Smart Connect)"
  value       = try(module.kafka_instance[0].connector_id, null)
}

output "kafka_instance_connector_node_num" {
  description = "The number of connector nodes"
  value       = try(module.kafka_instance[0].connector_node_num, null)
}

################################################################################
# Kafka Instance - Port Protocol Information
################################################################################

output "kafka_instance_port_protocol" {
  description = "The instance connection address information including private/public addresses and domain names"
  value       = try(module.kafka_instance[0].port_protocol, null)
}

################################################################################
# Kafka Instance - Security Information
################################################################################

output "kafka_instance_ssl_two_way_enable" {
  description = "Whether two-way authentication is enabled"
  value       = try(module.kafka_instance[0].ssl_two_way_enable, null)
}

output "kafka_instance_cert_replaced" {
  description = "Whether the certificate can be replaced"
  value       = try(module.kafka_instance[0].cert_replaced, null)
}

################################################################################
# Kafka Instance - User & Metadata
################################################################################

output "kafka_instance_user_id" {
  description = "The ID of the user who created the Kafka instance"
  value       = try(module.kafka_instance[0].user_id, null)
}

output "kafka_instance_user_name" {
  description = "The name of the user who created the Kafka instance"
  value       = try(module.kafka_instance[0].user_name, null)
}

output "kafka_instance_created_at" {
  description = "The create time of the Kafka instance"
  value       = try(module.kafka_instance[0].created_at, null)
}

################################################################################
# Kafka Instance - Additional Attributes
################################################################################

output "kafka_instance_charging_mode" {
  description = "The charging mode of the instance"
  value       = try(module.kafka_instance[0].charging_mode, null)
}

output "kafka_instance_is_logical_volume" {
  description = "Whether the instance is a new instance"
  value       = try(module.kafka_instance[0].is_logical_volume, null)
}

output "kafka_instance_message_query_inst_enable" {
  description = "Whether message query is enabled"
  value       = try(module.kafka_instance[0].message_query_inst_enable, null)
}

################################################################################
# RabbitMQ Instance - Basic Information
################################################################################

output "rabbitmq_instance_id" {
  description = "The RabbitMQ instance ID"
  value       = try(module.rabbitmq_instance[0].id, null)
}

output "rabbitmq_instance_name" {
  description = "The RabbitMQ instance name"
  value       = try(module.rabbitmq_instance[0].name, null)
}

output "rabbitmq_instance_status" {
  description = "The status of the RabbitMQ instance"
  value       = try(module.rabbitmq_instance[0].status, null)
}

output "rabbitmq_instance_engine" {
  description = "The message engine type"
  value       = try(module.rabbitmq_instance[0].engine, null)
}

output "rabbitmq_instance_engine_version" {
  description = "The RabbitMQ engine version"
  value       = try(module.rabbitmq_instance[0].engine_version, null)
}

output "rabbitmq_instance_specification" {
  description = "The RabbitMQ instance specification"
  value       = try(module.rabbitmq_instance[0].specification, null)
}

output "rabbitmq_instance_type" {
  description = "The DMS RabbitMQ instance type"
  value       = try(module.rabbitmq_instance[0].type, null)
}

################################################################################
# RabbitMQ Instance - Network Information
################################################################################

output "rabbitmq_instance_port" {
  description = "The port number of the RabbitMQ instance"
  value       = try(module.rabbitmq_instance[0].port, null)
}

output "rabbitmq_instance_connect_address" {
  description = "The IP address of the RabbitMQ instance"
  value       = try(module.rabbitmq_instance[0].connect_address, null)
}

output "rabbitmq_instance_management_connect_address" {
  description = "The management address of the RabbitMQ instance"
  value       = try(module.rabbitmq_instance[0].management_connect_address, null)
}

################################################################################
# RabbitMQ Instance - Public Access
################################################################################

output "rabbitmq_instance_enable_public_ip" {
  description = "Whether public access to the RabbitMQ instance is enabled"
  value       = try(module.rabbitmq_instance[0].enable_public_ip, null)
}

output "rabbitmq_instance_public_ip_address" {
  description = "The public IP address of the RabbitMQ instance"
  value       = try(module.rabbitmq_instance[0].public_ip_address, null)
}

################################################################################
# RabbitMQ Instance - Storage Information
################################################################################

output "rabbitmq_instance_storage_space" {
  description = "The message storage capacity in GB"
  value       = try(module.rabbitmq_instance[0].storage_space, null)
}

output "rabbitmq_instance_used_storage_space" {
  description = "The used message storage space in GB"
  value       = try(module.rabbitmq_instance[0].used_storage_space, null)
}

output "rabbitmq_instance_extend_times" {
  description = "The extend times"
  value       = try(module.rabbitmq_instance[0].extend_times, null)
}

################################################################################
# RabbitMQ Instance - Cluster Information
################################################################################

output "rabbitmq_instance_resource_spec_code" {
  description = "The resource specifications identifier"
  value       = try(module.rabbitmq_instance[0].resource_spec_code, null)
}

output "rabbitmq_instance_is_logical_volume" {
  description = "Whether the instance is a new instance"
  value       = try(module.rabbitmq_instance[0].is_logical_volume, null)
}

################################################################################
# RabbitMQ Instance - User & Metadata
################################################################################

output "rabbitmq_instance_user_id" {
  description = "The ID of the user who created the RabbitMQ instance"
  value       = try(module.rabbitmq_instance[0].user_id, null)
}

output "rabbitmq_instance_user_name" {
  description = "The name of the user who created the RabbitMQ instance"
  value       = try(module.rabbitmq_instance[0].user_name, null)
}

output "rabbitmq_instance_created_at" {
  description = "The create time of the RabbitMQ instance"
  value       = try(module.rabbitmq_instance[0].created_at, null)
}

output "rabbitmq_instance_charging_mode" {
  description = "The charging mode of the RabbitMQ instance"
  value       = try(module.rabbitmq_instance[0].charging_mode, null)
}

################################################################################
# RabbitMQ Instance - Vhosts
################################################################################

output "rabbitmq_vhost_ids" {
  description = "A map of vhost name to vhost ID"
  value       = try(module.rabbitmq_instance[0].vhost_ids, null)
}

output "rabbitmq_vhost_tracing" {
  description = "A map of vhost name to tracing enabled status"
  value       = try(module.rabbitmq_instance[0].vhost_tracing, null)
}

################################################################################
# RabbitMQ Instance - Users
################################################################################

output "rabbitmq_user_ids" {
  description = "A map of user access_key to user ID"
  value       = try(module.rabbitmq_instance[0].user_ids, null)
}

################################################################################
# RabbitMQ Instance - Plugins
################################################################################

output "rabbitmq_plugin_ids" {
  description = "A map of plugin name to plugin ID"
  value       = try(module.rabbitmq_instance[0].plugin_ids, null)
}

output "rabbitmq_plugin_details" {
  description = "A map of plugin name to plugin details (enable, running, version)"
  value       = try(module.rabbitmq_instance[0].plugin_details, null)
}
