variable "statement_id" {
  description = "Statement ID for the permission"
  type        = string
}

variable "action" {
  description = "The AWS Lambda action you want to allow in this statement"
  type        = string
}

variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "principal" {
  description = "The principal who is getting this permission"
  type        = string
}

variable "qualifier" {
  description = "Lambda Function Version or Alias Name"
  type        = string
}

variable "source_arn" {
  description = "The ARN of a resource that is invoking your function"
  type        = string
}
