module "naming" {
  source      = "git::https://github.com/MagnetarIT/terraform-naming-standard.git?ref=tags/0.1.0"
  namespace   = var.namespace
  environment = var.environment
  name        = var.name
  attributes  = var.attributes
  tags        = var.tags
}

resource "aws_security_group" "sg" {
  name_prefix            = "${module.naming.id}-"
  vpc_id                 = var.vpc_id
  tags                   = module.naming.tags
  revoke_rules_on_delete = var.revoke_rules_on_delete
}

resource "aws_security_group_rule" "with_cidr" {
  count             = length(var.sg_rules_cidr)
  security_group_id = aws_security_group.sg.id
  type              = lookup(var.sg_rules_cidr[count.index], "type")
  description       = lookup(var.sg_rules_cidr[count.index], "description")
  from_port         = lookup(var.sg_rules_cidr[count.index], "from_port")
  to_port           = lookup(var.sg_rules_cidr[count.index], "to_port")
  protocol          = lookup(var.sg_rules_cidr[count.index], "protocol")
  cidr_blocks       = lookup(var.sg_rules_cidr[count.index], "cidr_blocks")
}

resource "aws_security_group_rule" "with_sg_ids" {
  count                    = length(var.sg_rules_sg_ids)
  security_group_id        = aws_security_group.sg.id
  type                     = lookup(var.sg_rules_sg_ids[count.index], "type")
  description              = lookup(var.sg_rules_sg_ids[count.index], "description")
  from_port                = lookup(var.sg_rules_sg_ids[count.index], "from_port")
  to_port                  = lookup(var.sg_rules_sg_ids[count.index], "to_port")
  protocol                 = lookup(var.sg_rules_sg_ids[count.index], "protocol")
  source_security_group_id = lookup(var.sg_rules_sg_ids[count.index], "source_security_group_id", "") != "" ? lookup(var.sg_rules_sg_ids[count.index], "source_security_group_id", "") : aws_security_group.sg.id
}
