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
    "rogeria_sre_1",
    "user_sre_2",
    "user_sre_3",
    "developer_frontend_1",
    "developer_frontend_2",
    "developer_frontend_3",
    "developer_backend_1",
    "developer_backend_2",
    "developer_backend_3",
    "data_engineer_1",
    "data_engineer_2",
    "data_engineer_3"
  ]
}
