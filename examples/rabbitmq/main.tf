provider "huaweicloud" {
  region = local.region
}

data "huaweicloud_availability_zones" "available" {}

locals {
  name   = "ex-${basename(path.cwd)}"
  region = "tr-west-1"

  vpc_cidr = "10.3.0.0/16"
  azs      = slice(data.huaweicloud_availability_zones.available.names, 0, 3)

  tags = {
    Name    = local.name
    Example = local.name
  }
}

################################################################################
# DMS RabbitMQ Module
################################################################################

module "rabbitmq" {
  source = "../../"

  create_rabbitmq_instance = true
  create_kafka_instance    = false

  rabbitmq_name              = local.name
  rabbitmq_engine_version    = "3.8.35"
  rabbitmq_flavor_id         = "rabbitmq.2u4g.cluster"
  rabbitmq_storage_spec_code = "dms.physical.storage.high.v2"
  rabbitmq_storage_space     = 300
  rabbitmq_broker_num        = 3

  rabbitmq_availability_zones = local.azs

  rabbitmq_vpc_id            = module.vpc.vpc_id
  rabbitmq_network_id        = module.vpc.private_subnets[0]
  rabbitmq_security_group_id = module.security_group.security_group_id

  rabbitmq_access_user = "admin"
  rabbitmq_password    = "YourPassword@123"
  rabbitmq_ssl_enable  = false

  tags = local.tags
}

################################################################################
# Supporting Resources
################################################################################

module "vpc" {
  source = "github.com/artifactsystems/terraform-huawei-vpc?ref=v1.0.0"

  name = local.name
  cidr = local.vpc_cidr

  azs = local.azs

  private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k)]

  tags = local.tags
}

module "security_group" {
  source = "github.com/artifactsystems/terraform-huawei-security-group?ref=v1.0.0"

  name        = local.name
  description = "Basic RabbitMQ example security group"

  ingress_with_cidr_blocks = [
    {
      from_port   = 5672
      to_port     = 5672
      protocol    = "tcp"
      description = "AMQP access from within VPC"
      cidr_blocks = module.vpc.vpc_cidr_block
    },
    {
      from_port   = 5671
      to_port     = 5671
      protocol    = "tcp"
      description = "AMQP-SSL access from within VPC"
      cidr_blocks = module.vpc.vpc_cidr_block
    },
    {
      from_port   = 15672
      to_port     = 15672
      protocol    = "tcp"
      description = "RabbitMQ management UI access from within VPC"
      cidr_blocks = module.vpc.vpc_cidr_block
    },
  ]

  tags = local.tags
}
