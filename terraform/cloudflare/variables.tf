variable "cloudflare_api_token" {
  type        = string
  description = "API token for the Cloudflare account"
}

variable "zone_id" {
  type        = string
  description = "Zone ID for the Cloudflare account"
  default     = "774c57de3172a6220c23461a2992c3a8"
}

variable "default_comment" {
  type        = string
  description = "Default comment for the Cloudflare account"
  default     = "Managed by Terraform"
}
