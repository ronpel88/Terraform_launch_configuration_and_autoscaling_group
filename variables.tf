/*
Variables are defined here
*/

variable "access_key" {}
variable "secret_key" {}

variable "region" {}

variable "subnet_ids" {
  type = "list"
}

variable instance_types_and_prices {
  type = "map"
}

variable image_type {}