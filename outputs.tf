output "security_group_id" {
  description = "The ID of the security group"
  value       = "${aws_security_group.sg.id}"
}

output "security_group_arn" {
  description = "The ARN of the security group"
  value       = "${aws_security_group.sg.arn}"
}

output "vpc_id" {
  description = "The VPC ID."
  value       = "${aws_security_group.sg.vpc_id}"
}

output "name " {
  description = "The name of the security group"
  value       = "${aws_security_group.sg.name}"
}

output "description" {
  description = "The description of the security group"
  value       = "${aws_security_group.sg.description}"
}

output "ingress" {
  description = "The ingress rules. See above for more."
  value       = "${aws_security_group.sg.ingress}"
}

output "egress" {
  description = "The egress rules. See above for more."
  value       = "${aws_security_group.sg.egress}"
}

