variable "region" {
  description = "Region for resources to be deployed in"
  default = "ap-southeast-1"
}

variable "aap_username" {
  description = "Ansible Automation Platform username"
}

variable "aap_password" {
  description = "Ansible Automation Platform password"
}

variable "aap_hostname" {
  description = "Ansible Automation Platform hostname or IP address"
}

variable "ssh_public_key" {
  description = "Public SSH key for EC2 access"
  type        = string
  sensitive   = true
}


# variable "resource_group_name" {
#   description = "Resource group name that follows the [**geo**]-[**client**]-[**product**]-[**type**]-[**resource**] convention"
#   default = "asean-int-automation-test"
# }

# variable "vpc_name" {
#   description = "VPC for Instana to be deployed in"
#   default = "asean-int-automation-test-vpc"
# }

# variable "sg_name" {
#   description = "Security Group name"
#   default = "sg-mbs-terraform-poc"
# }