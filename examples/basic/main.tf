provider "huaweicloud" {
  region = local.region
}

data "huaweicloud_availability_zones" "available" {}

locals {
  name   = "ex-${basename(path.cwd)}"
  region = "tr-west-1"

  vpc_cidr = "10.2.0.0/16"
  azs      = slice(data.huaweicloud_availability_zones.available.names, 0, 1) # Kafka requires 1 or 3+ AZs, not 2

  tags = {
    Name    = local.name
    Example = local.name
  }
}

################################################################################
# DMS Kafka Module
################################################################################

module "kafka" {
  source = "../../"

  name              = local.name
  engine_version    = "2.7"
  flavor_id         = "kafka.2u4g.cluster.small"
  storage_spec_code = "dms.physical.storage.high.v2"
  storage_space     = 300
  broker_num        = 3

  availability_zones = local.azs

  vpc_id            = module.vpc.vpc_id
  network_id        = module.vpc.private_subnets[0]
  security_group_id = module.security_group.security_group_id

  # Optional: Enable SSL with SASL authentication
  ssl_enable  = true
  access_user = "admin"
  password    = "YourPassword@123"

  # Kafka parameters
  parameters = [
    {
      name  = "min.insync.replicas"
      value = "2"
    }
  ]

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
  description = "Basic Kafka example security group"

  ingress_with_cidr_blocks = [
    {
      from_port   = 9092
      to_port     = 9092
      protocol    = "tcp"
      description = "Kafka plaintext access from within VPC"
      cidr_blocks = module.vpc.vpc_cidr_block
    },
    {
      from_port   = 9093
      to_port     = 9093
      protocol    = "tcp"
      description = "Kafka SSL access from within VPC"
      cidr_blocks = module.vpc.vpc_cidr_block
    },
  ]

  tags = local.tags
}
