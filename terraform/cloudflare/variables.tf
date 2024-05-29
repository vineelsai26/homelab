variable "cloudflare_api_token" {
  type        = string
  description = "API token for the Cloudflare account"
}

variable "zone_id_vineelsai_com" {
  type        = string
  description = "Zone ID for the Cloudflare account"
  default     = "774c57de3172a6220c23461a2992c3a8"
}

variable "zone_id_vineelsai_dev" {
  type        = string
  description = "Zone ID for the Cloudflare account"
  default     = "2d4abd2683ccad5413992e833fa04c7a"
}

variable "default_comment" {
  type        = string
  description = "Default comment for the Cloudflare account"
  default     = "Managed by Terraform"
}
