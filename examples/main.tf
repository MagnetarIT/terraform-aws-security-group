provider "aws" {
  region = "eu-west-2"
}

# create a security group with CIDR and SGID rules
module "sg" {
  source          = "../"
  namespace       = "mag"
  environment     = "prod"
  name            = "myapp"
  sg_rules_cidr   = local.sg_rules_cidr
  sg_rules_sg_ids = local.sg_rules_sg_ids
}

locals {
  sg_rules_cidr = [
    {
      type        = "ingress"
      description = "HTTPS"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/8", "172.16.0.0/12"]
    },
  ]

  sg_rules_sg_ids = [
    {
      type                     = "ingress"
      description              = "SSH"
      from_port                = 22
      to_port                  = 22
      protocol                 = "tcp"
      source_security_group_id = "" # no value here will create a rule for 'self'
    },
  ]
}
