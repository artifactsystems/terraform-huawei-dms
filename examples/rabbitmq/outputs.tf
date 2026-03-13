################################################################################
# RabbitMQ Instance
################################################################################

output "rabbitmq_instance_id" {
  description = "The RabbitMQ instance ID"
  value       = module.rabbitmq.rabbitmq_instance_id
}

output "rabbitmq_instance_name" {
  description = "The RabbitMQ instance name"
  value       = module.rabbitmq.rabbitmq_instance_name
}

output "rabbitmq_instance_status" {
  description = "The RabbitMQ instance status"
  value       = module.rabbitmq.rabbitmq_instance_status
}

output "rabbitmq_connect_address" {
  description = "The RabbitMQ instance connection address"
  value       = module.rabbitmq.rabbitmq_instance_connect_address
}

output "rabbitmq_management_address" {
  description = "The RabbitMQ management UI address"
  value       = module.rabbitmq.rabbitmq_instance_management_connect_address
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
