variable "domain_name" {
  description = "The domain name to use for the certificate."
  default     = null
}

variable "validation_method" {
  description = "Which method to use for validation. DNS or EMAIL are valid, NONE can be used for certificates that were imported into ACM and then into Terraform."
  default     = "DNS"
}
