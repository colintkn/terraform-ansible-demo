terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.21.0"
    }

    aap = {
      source = "ansible/aap"
    }
  }
}

provider "aws" {
  region = var.region
}


provider "aap" {
  host = var.aap_hostname
  username = var.aap_username
  password = var.aap_password
  insecure_skip_verify = true
}
