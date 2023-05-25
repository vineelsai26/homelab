terraform {
    required_version = ">= 1.4.6"
    required_providers {
        cloudflare = {
            source = "cloudflare/cloudflare"
            version = ">= 4.6.0"
        }
    }
}