terraform {
  required_version = ">= 1.6.6"
  required_providers {
    vercel = {
      source = "vercel/vercel"
      version = "~> 1.11.0"
    }
  }
  cloud {
    organization = "vineelsai"

    workspaces {
      name = "Vercel"
    }
  }
}

provider "vercel" {
  # Or omit this for the api_token to be read
  # from the VERCEL_API_TOKEN environment variable
  api_token = var.vercel_api_token

  # Optional default team for all resources
  team = "vineel"
}
