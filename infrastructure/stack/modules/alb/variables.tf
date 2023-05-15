variable "name" {
  description = "the app name"
  type    = string
}

variable "vpc_id" {
  description = "the vpc id"
  type    = string
}

variable "subnets" {
  description = "list of the vpc subnet ids"
  type = list
}

variable "container_port" {
  description = "the container port exposing the service"
  type    = number
}

variable "app_port" {
  description = "the lb port exposing the application"
  type    = number
}
