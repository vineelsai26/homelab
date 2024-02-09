variable "filename" {
  type = string
}

variable "function_name" {
  type = string
}

variable "handler" {
  type = string
}

variable "runtime" {
  type = string
}

variable "publish" {
  type    = bool
  default = false
}

variable "source_code_hash" {
  type = string
}

variable "role" {
  type = string
}
