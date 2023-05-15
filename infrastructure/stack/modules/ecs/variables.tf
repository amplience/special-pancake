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

variable "alb_target_group_arn" {
  description = "the ARN of the ALB target group"
  type = string
}

variable "container_image" {
  description = "the container image name, including repository"
  type = string
}