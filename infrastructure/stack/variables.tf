variable "name" {
  description = "the app name"
  type    = string
}

variable "app_port" {
  type    = number
}

variable "container_port" {
  type    = number
}

variable "container_image" {
  type    = string
}
