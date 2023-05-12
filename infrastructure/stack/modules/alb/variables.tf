variable "name" {
  description = "the app name"
  type    = string
}

variable "vpc_id" {
  type    = string
}

variable "subnets" {
  type = list
}

variable "container_port" {
  type    = number
}

variable "app_port" {
  type    = number
}
