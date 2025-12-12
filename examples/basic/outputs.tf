################################################################################
# Kafka Instance
################################################################################

output "kafka_instance_id" {
  description = "The Kafka instance ID"
  value       = module.kafka.kafka_instance_id
}

output "kafka_instance_name" {
  description = "The Kafka instance name"
  value       = module.kafka.kafka_instance_name
}

output "kafka_instance_status" {
  description = "The Kafka instance status"
  value       = module.kafka.kafka_instance_status
}

output "kafka_instance_connect_address" {
  description = "The Kafka instance connection address"
  value       = module.kafka.kafka_instance_connect_address
}

output "kafka_instance_port" {
  description = "The Kafka instance port"
  value       = module.kafka.kafka_instance_port
}

output "kafka_instance_partition_num" {
  description = "The number of partitions"
  value       = module.kafka.kafka_instance_partition_num
}

################################################################################
# Supporting Resources
################################################################################

output "vpc_id" {
  description = "The VPC ID"
  value       = module.vpc.vpc_id
}

output "security_group_id" {
  description = "The security group ID"
  value       = module.security_group.security_group_id
}
