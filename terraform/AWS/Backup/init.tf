terraform {
  required_version = ">= 1.6.6"
  cloud {
    organization = "vineelsai"

    workspaces {
      name = "AWS-Backup"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
