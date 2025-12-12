resource "huaweicloud_dms_kafka_instance" "this" {
  region = var.region
  name   = var.use_name_prefix ? null : var.name

  # Flavor configuration (flavor_id and product_id are alternative)
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
  dynamic "cross_vpc_accesses" {
    for_each = var.cross_vpc_accesses != null ? var.cross_vpc_accesses : []
    content {
      advertised_ip = cross_vpc_accesses.value.advertised_ip
    }
  }

  # Port protocol configuration
  dynamic "port_protocol" {
    for_each = var.port_protocol != null ? [var.port_protocol] : []
    content {
      private_plain_enable          = port_protocol.value.private_plain_enable
      private_sasl_ssl_enable       = port_protocol.value.private_sasl_ssl_enable
      private_sasl_plaintext_enable = port_protocol.value.private_sasl_plaintext_enable
      public_plain_enable           = port_protocol.value.public_plain_enable
      public_sasl_ssl_enable        = port_protocol.value.public_sasl_ssl_enable
      public_sasl_plaintext_enable  = port_protocol.value.public_sasl_plaintext_enable
    }
  }

  # Maintenance & Operations
  maintain_begin    = var.maintain_begin
  maintain_end      = var.maintain_end
  retention_policy  = var.retention_policy
  enable_auto_topic = var.enable_auto_topic
  dumping           = var.dumping
  description       = var.description

  # Parameters
  dynamic "parameters" {
    for_each = var.parameters
    content {
      name  = parameters.value.name
      value = parameters.value.value
    }
  }

  # Enterprise & Billing
  enterprise_project_id = var.enterprise_project_id
  charging_mode         = var.charging_mode
  period_unit           = var.period_unit
  period                = var.period
  auto_renew            = var.auto_renew

  # Tags
  tags = var.tags

  # Timeouts
  dynamic "timeouts" {
    for_each = length(var.timeouts) > 0 ? [var.timeouts] : []
    content {
      create = try(timeouts.value.create, null)
      update = try(timeouts.value.update, null)
      delete = try(timeouts.value.delete, null)
    }
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      password,
      security_protocol,
      enabled_mechanisms,
      arch_type,
      new_tenant_ips,
      name
    ]
  }
}
