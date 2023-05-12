terraform {
  backend "local" {
    path = "./container-registry.tfstate"
  }

  required_providers {
    aws = {
      version = "~> 4.66.1"
    }
  }
}

resource "aws_ecr_repository" "main" {
  name = "${var.name}-ecr-repository"
  image_tag_mutability = "MUTABLE" # so latest can be tagged
}
