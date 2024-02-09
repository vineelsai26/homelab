variable "aws_region" {
  description = "The AWS Region in which to create resources."
  default     = "ap-south-1"
}

variable "aws_region_virginia" {
  description = "The AWS Region in which to create resources."
  default     = "us-east-1"
}

variable "aws_access_key" {
  description = "The AWS access key to use."
}

variable "aws_secret_key" {
  description = "The AWS secret key to use."
}
