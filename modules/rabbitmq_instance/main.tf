resource "huaweicloud_dms_rabbitmq_instance" "this" {
  region = var.region
  name   = var.use_name_prefix ? null : var.name

  flavor_id         = var.flavor_id
  engine_version    = var.engine_version
  storage_spec_code = var.storage_spec_code
  storage_space     = var.storage_space
  broker_num        = var.broker_num

  vpc_id             = var.vpc_id
  network_id         = var.network_id
  security_group_id  = var.security_group_id
  availability_zones = var.availability_zones

  access_user = var.access_user
  password    = var.password
  ssl_enable  = var.ssl_enable
  enable_acl  = var.enable_acl

  public_ip_id = var.public_ip_id

  maintain_begin = var.maintain_begin
  maintain_end   = var.maintain_end
  description    = var.description

  enterprise_project_id = var.enterprise_project_id
  charging_mode         = var.charging_mode
  period_unit           = var.period_unit
  period                = var.period
  auto_renew            = var.auto_renew

  tags = var.tags

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
    ignore_changes        = [password, auto_renew, period, period_unit, name]
  }
}

resource "huaweicloud_dms_rabbitmq_vhost" "this" {
  for_each    = var.vhosts
  region      = var.region
  instance_id = huaweicloud_dms_rabbitmq_instance.this.id
  name        = each.key
}

resource "huaweicloud_dms_rabbitmq_user" "this" {
  for_each    = var.users
  region      = var.region
  instance_id = huaweicloud_dms_rabbitmq_instance.this.id
  access_key  = each.key
  secret_key  = each.value.secret_key

  dynamic "vhosts" {
    for_each = each.value.vhosts
    content {
      vhost = vhosts.value.vhost
      conf  = vhosts.value.conf
      write = vhosts.value.write
      read  = vhosts.value.read
    }
  }
}

resource "huaweicloud_dms_rabbitmq_plugin" "this" {
  for_each    = toset(var.plugins)
  region      = var.region
  instance_id = huaweicloud_dms_rabbitmq_instance.this.id
  name        = each.value

  dynamic "timeouts" {
    for_each = length(var.plugin_timeouts) > 0 ? [var.plugin_timeouts] : []
    content {
      create = try(timeouts.value.create, null)
      delete = try(timeouts.value.delete, null)
    }
  }
}
