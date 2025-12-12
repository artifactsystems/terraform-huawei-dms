locals {
  create_kafka_instance = var.create_kafka_instance && var.create
}

################################################################################
# DMS Kafka Instance
################################################################################

module "kafka_instance" {
  count  = local.create_kafka_instance ? 1 : 0
  source = "./modules/kafka_instance"

  region          = var.region
  name            = var.name
  use_name_prefix = var.use_name_prefix
  description     = var.description

  # Flavor configuration
  flavor_id         = var.flavor_id
  product_id        = var.product_id
  engine_version    = var.engine_version
  storage_spec_code = var.storage_spec_code
  storage_space     = var.storage_space
  broker_num        = var.broker_num
  arch_type         = var.arch_type

  # Network configuration
  vpc_id             = var.vpc_id
  network_id         = var.network_id
  security_group_id  = var.security_group_id
  availability_zones = var.availability_zones
  ipv6_enable        = var.ipv6_enable
  new_tenant_ips     = var.new_tenant_ips

  # Authentication & Security
  ssl_enable         = var.ssl_enable
  access_user        = var.access_user
  password           = var.password
  security_protocol  = var.security_protocol
  enabled_mechanisms = var.enabled_mechanisms
  vpc_client_plain   = var.vpc_client_plain

  # Public access
  public_ip_ids = var.public_ip_ids

  # Cross-VPC access
  cross_vpc_accesses = var.cross_vpc_accesses

  # Port protocol configuration
  port_protocol = var.port_protocol

  # Maintenance & Operations
  maintain_begin    = var.maintain_begin
  maintain_end      = var.maintain_end
  retention_policy  = var.retention_policy
  enable_auto_topic = var.enable_auto_topic
  dumping           = var.dumping

  # Parameters
  parameters = var.parameters

  # Enterprise & Billing
  enterprise_project_id = var.enterprise_project_id
  charging_mode         = var.charging_mode
  period_unit           = var.period_unit
  period                = var.period
  auto_renew            = var.auto_renew

  # Tags & Timeouts
  tags     = var.tags
  timeouts = var.timeouts
}
