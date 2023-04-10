variable "environment" {
  type        = string
  description = "Environment where the resource will be deployed"
}

variable "region" {
  type        = string
  description = "The name of the AWS region"
}

variable "users" {
  description = "All required users"
  type        = list(string)
  default = [
  ]
}
