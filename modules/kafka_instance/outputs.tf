################################################################################
# Basic Information
################################################################################

output "id" {
  description = "The Kafka instance ID"
  value       = huaweicloud_dms_kafka_instance.this.id
}

output "name" {
  description = "The Kafka instance name"
  value       = huaweicloud_dms_kafka_instance.this.name
}

output "status" {
  description = "The status of the Kafka instance"
  value       = huaweicloud_dms_kafka_instance.this.status
}

output "engine" {
  description = "The message engine type"
  value       = huaweicloud_dms_kafka_instance.this.engine
}

output "engine_version" {
  description = "The Kafka engine version"
  value       = huaweicloud_dms_kafka_instance.this.engine_version
}

output "type" {
  description = "The DMS Kafka instance type"
  value       = huaweicloud_dms_kafka_instance.this.type
}

################################################################################
# Network Information
################################################################################

output "port" {
  description = "The port number of the Kafka instance"
  value       = huaweicloud_dms_kafka_instance.this.port
}

output "connect_address" {
  description = "The IP address of the Kafka instance"
  value       = huaweicloud_dms_kafka_instance.this.connect_address
}

output "pod_connect_address" {
  description = "The connection address on the tenant side"
  value       = huaweicloud_dms_kafka_instance.this.pod_connect_address
}

output "ipv6_connect_addresses" {
  description = "The IPv6 connect addresses list"
  value       = huaweicloud_dms_kafka_instance.this.ipv6_connect_addresses
}

output "cross_vpc_accesses" {
  description = "The cross-VPC access information"
  value       = huaweicloud_dms_kafka_instance.this.cross_vpc_accesses
}

################################################################################
# Public Access
################################################################################

output "enable_public_ip" {
  description = "Whether public access is enabled"
  value       = huaweicloud_dms_kafka_instance.this.enable_public_ip
}

output "public_ip_address" {
  description = "The public IP addresses list"
  value       = huaweicloud_dms_kafka_instance.this.public_ip_address
}

output "public_bandwidth" {
  description = "The public network access bandwidth"
  value       = huaweicloud_dms_kafka_instance.this.public_bandwidth
}

################################################################################
# Storage Information
################################################################################

output "storage_space" {
  description = "The message storage capacity in GB"
  value       = huaweicloud_dms_kafka_instance.this.storage_space
}

output "used_storage_space" {
  description = "The used message storage space in GB"
  value       = huaweicloud_dms_kafka_instance.this.used_storage_space
}

output "storage_type" {
  description = "The storage type"
  value       = huaweicloud_dms_kafka_instance.this.storage_type
}

output "storage_resource_id" {
  description = "The storage resource ID"
  value       = huaweicloud_dms_kafka_instance.this.storage_resource_id
}

output "extend_times" {
  description = "The extend times"
  value       = huaweicloud_dms_kafka_instance.this.extend_times
}

################################################################################
# Cluster Information
################################################################################

output "partition_num" {
  description = "The number of partitions"
  value       = huaweicloud_dms_kafka_instance.this.partition_num
}

output "broker_num" {
  description = "The number of brokers"
  value       = huaweicloud_dms_kafka_instance.this.broker_num
}

output "node_num" {
  description = "The node quantity"
  value       = huaweicloud_dms_kafka_instance.this.node_num
}

output "resource_spec_code" {
  description = "The resource specifications identifier"
  value       = huaweicloud_dms_kafka_instance.this.resource_spec_code
}

################################################################################
# Connector Information
################################################################################

output "connector_id" {
  description = "The connector ID"
  value       = huaweicloud_dms_kafka_instance.this.connector_id
}

output "connector_node_num" {
  description = "The number of connector nodes"
  value       = huaweicloud_dms_kafka_instance.this.connector_node_num
}

################################################################################
# Port Protocol Information
################################################################################

output "port_protocol" {
  description = "The instance connection address information"
  value       = huaweicloud_dms_kafka_instance.this.port_protocol
}

################################################################################
# Security Information
################################################################################

output "ssl_two_way_enable" {
  description = "Whether two-way authentication is enabled"
  value       = huaweicloud_dms_kafka_instance.this.ssl_two_way_enable
}

output "cert_replaced" {
  description = "Whether the certificate can be replaced"
  value       = huaweicloud_dms_kafka_instance.this.cert_replaced
}

################################################################################
# User & Metadata
################################################################################

output "user_id" {
  description = "The ID of the user who created the Kafka instance"
  value       = huaweicloud_dms_kafka_instance.this.user_id
}

output "user_name" {
  description = "The name of the user who created the Kafka instance"
  value       = huaweicloud_dms_kafka_instance.this.user_name
}

output "created_at" {
  description = "The create time of the Kafka instance"
  value       = huaweicloud_dms_kafka_instance.this.created_at
}

################################################################################
# Additional Attributes
################################################################################

output "charging_mode" {
  description = "The charging mode of the instance"
  value       = huaweicloud_dms_kafka_instance.this.charging_mode
}

output "is_logical_volume" {
  description = "Whether the instance is a new instance"
  value       = huaweicloud_dms_kafka_instance.this.is_logical_volume
}

output "message_query_inst_enable" {
  description = "Whether message query is enabled"
  value       = huaweicloud_dms_kafka_instance.this.message_query_inst_enable
}
