

resource "aws_lb" "main" {
  name               = "${var.name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.load_balancer_sg.id]
  subnets = var.subnets

  enable_deletion_protection = false
}

resource "aws_alb_listener" "main" {
  load_balancer_arn = aws_lb.main.id
  port              = var.app_port
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.main.arn
  }
}

resource "aws_alb_target_group" "main" {
  name        = "${var.name}-alb-target-group"
  port        = var.container_port # fargate container port has to be same as host port
  protocol    = "HTTP"
  vpc_id = var.vpc_id
  target_type = "ip" # type "ip" for awsvpc network mode

#  health_check {
#   healthy_threshold   = "1"
#   interval            = "30"
#   protocol            = "HTTP"
#   matcher             = "200"
#   timeout             = "3"
#   path                = var.health_check_path
#   unhealthy_threshold = "0"
#  }
}

