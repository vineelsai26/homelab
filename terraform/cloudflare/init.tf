terraform {
  required_version = ">= 1.6.6"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 4.22.0"
    }
  }
  cloud {
    organization = "vineelsai"

    workspaces {
      name = "Cloudflare"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

data "terraform_remote_state" "aws_prod" {
  backend = "remote"

  config = {
    organization = "vineelsai"
    workspaces = {
      name = "AWS-Prod"
    }
  }
}
