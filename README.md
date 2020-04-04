<a href=https://magnetarconsulting.co.uk><img src="https://magnetarconsulting.co.uk/wp-content/uploads/2020/04/small-helping-you-innovate-magnetar.png" width="300"></a>

# terraform-aws-security-group
Terraform (>= 0.12.0) module which creates Security Group in AWS 

- [Intro](#Intro)
- [Example](#Example)
- [Inputs](#Inputs)
- [Outputs](#Outputs)
- [Support](#Support)
- [License](#License)


----

## Example
```hcl
provider "aws" {
  region = "eu-west-2"
}

# create a security group with CIDR and SGID rules
module "sg" {
  source          = "git::https://github.com/MagnetarIT/terraform-aws-security-group.git?ref=tags/0.1.0"
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
```

----

## Intro
This module will create the following resources
- Security Group
- Security Group Rules using CIDR (Optional)
- Security Group Rules using SG ID/Self (Optional)

---

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 |

---

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attributes | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| environment | Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT' | `string` | n/a | yes |
| name | Solution name, e.g. 'app' or 'jenkins' | `string` | n/a | yes |
| namespace | Namespace, which could be your team, business name or abbreviation, e.g. 'mag' or 'tar' | `string` | n/a | yes |
| revoke\_rules\_on\_delete | Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself. | `bool` | `true` | no |
| sg\_rules\_cidr | List of Security Group rule objects for CIDR rules | <pre>list(object({<br>    type        = string<br>    description = string<br>    from_port   = string<br>    to_port     = string<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | `[]` | no |
| sg\_rules\_sg\_ids | List of Security Group rule objects for Security Group ID rules, leave `source_security_group_id` empty for implied self rule. | <pre>list(object({<br>    type                     = string<br>    description              = string<br>    from_port                = string<br>    to_port                  = string<br>    protocol                 = string<br>    source_security_group_id = string<br>  }))</pre> | `[]` | no |
| tags | Additional tags (e.g. `map('BusinessUnit','XYZ')` | `map(string)` | `{}` | no |
| vpc\_id | Solution name, e.g. 'app' or 'jenkins' | `string` | `""` | no |

---

## Outputs

| Name | Description |
|------|-------------|
| description | The description of the security group |
| egress | The egress rules. See above for more. |
| ingress | The ingress rules. See above for more. |
| name  | The name of the security group |
| security\_group\_arn | The ARN of the security group |
| security\_group\_id | The ID of the security group |
| vpc\_id | The VPC ID. |

---

## Support

Reach out to me at one of the following places!

- Website at <a href="https://magnetarconsulting.co.uk" target="_blank">`magnetarconsulting.co.uk`</a>
- Twitter at <a href="https://twitter.com/magnetarIT" target="_blank">`@magnetarIT`</a>
- LinkedIn at <a href="https://www.linkedin.com/company/magnetar-it-consulting" target="_blank">`magnetar-it-consulting`</a>

---

## License 

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.