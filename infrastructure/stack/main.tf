terraform {
  backend "local" {
    path = "./stack.tfstate"
  }

  required_providers {
    aws = {
      version = "~> 4.66.1"
    }
  }
}

# The default vpc data
data "aws_vpc" "default_vpc" {
  default = true
}

# Filter the subnets by default vpc id.
data "aws_subnets" "all_default_vpc_subnets" {
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.default_vpc.id]
  }
}

module "alb" {
  source = "./modules/alb"
  name = var.name
  vpc_id = data.aws_vpc.default_vpc.id
  subnets = data.aws_subnets.all_default_vpc_subnets.ids
  container_port = var.container_port
  app_port = var.app_port

  ecs_tasks_sg_id = module.ecs.sg_id
}

module "ecs" {
  source = "./modules/ecs"
  name = var.name
  vpc_id = data.aws_vpc.default_vpc.id
  subnets = data.aws_subnets.all_default_vpc_subnets.ids
  container_port = var.container_port
  alb_target_group_arn = module.alb.target_group_arn
  container_image = var.container_image

  lb_sg_id = module.alb.sg_id
}
