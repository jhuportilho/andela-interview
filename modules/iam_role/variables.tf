variable "policies" {}
variable "role_name" {}
variable "role_description" {}
variable "assume_role_policy" {}
variable "path" {
  type    = string
  default = "/"
}
variable "instance_profile" {
  type    = bool
  default = true
}
variable "max_session_duration" {
  default = "3600"
}
