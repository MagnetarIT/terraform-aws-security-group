variable "namespace" {
  type        = string
  description = "Namespace, which could be your team, business name or abbreviation, e.g. 'mag' or 'tar'"
}

variable "environment" {
  type        = string
  description = "Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT'"
}

variable "name" {
  type        = string
  description = "Solution name, e.g. 'app' or 'jenkins'"
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`"
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "Solution name, e.g. 'app' or 'jenkins'"
}

variable "sg_rules_cidr" {
  type = list(object({
    type        = string
    description = string
    from_port   = string
    to_port     = string
    protocol    = string
    cidr_blocks = list(string)
  }))
  default     = []
  description = "List of Security Group rule objects for CIDR rules"
}

variable "sg_rules_sg_ids" {
  type = list(object({
    type                     = string
    description              = string
    from_port                = string
    to_port                  = string
    protocol                 = string
    source_security_group_id = string
  }))
  default     = []
  description = "List of Security Group rule objects for Security Group ID rules, leave `source_security_group_id` empty for implied self rule."
}

variable "revoke_rules_on_delete" {
  type        = bool
  default     = true
  description = "Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself."
}

variable "create_default_egress_security_group_rule" {
  type = bool
  default = true
  description = "Create default Egress Security Group rule"
}

