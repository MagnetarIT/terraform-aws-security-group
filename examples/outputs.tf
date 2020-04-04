output "security_group_id" {
  description = "The ID of the security group"
  value       = module.sg.security_group_id
}

output "security_group_arn" {
  description = "The ARN of the security group"
  value       = module.sg.security_group_arn
}

output "vpc_id" {
  description = "The VPC ID."
  value       = module.sg.vpc_id
}

output "name" {
  description = "The name of the security group"
  value       = module.sg.name
}

output "description" {
  description = "The description of the security group"
  value       = module.sg.description
}

output "ingress" {
  description = "The ingress rules. See above for more."
  value       = module.sg.ingress
}

output "egress" {
  description = "The egress rules. See above for more."
  value       = module.sg.egress
}

