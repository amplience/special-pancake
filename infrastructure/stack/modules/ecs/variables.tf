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

variable "alb_target_group_arn" {
    type = string
}

variable "container_image" {
  type = string
}