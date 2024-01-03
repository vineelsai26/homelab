terraform {
    required_version = ">= 1.4.6"
    required_providers {
        cloudflare = {
            source = "cloudflare/cloudflare"
            version = ">= 4.6.0"
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