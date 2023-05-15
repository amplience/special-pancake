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
  name                 = var.ecr_registry_name
  image_tag_mutability = "MUTABLE" # so latest can be tagged
}
