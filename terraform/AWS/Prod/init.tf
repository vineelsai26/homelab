terraform {
  required_version = ">= 1.6.6"
  cloud {
    organization = "vineelsai"

    workspaces {
      name = "AWS-Prod"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.32.1"
    }
  }
}

# Configure the AWS Provider
# Aleast one provider without alias is required
provider "aws" {
  region                   = var.aws_region
  access_key               = var.aws_access_key
  secret_key               = var.aws_secret_key
  shared_credentials_files = ["~/.aws/credentials"]
}

provider "aws" {
  alias                    = "aws_virginia"
  region                   = var.aws_region_virginia
  access_key               = var.aws_access_key
  secret_key               = var.aws_secret_key
  shared_credentials_files = ["~/.aws/credentials"]
}
