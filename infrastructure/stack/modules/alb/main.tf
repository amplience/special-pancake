
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
  name        = "${var.name}-alb-tg"
  port        = var.container_port # fargate container port has to be same as host port
  protocol    = "HTTP"
  vpc_id = var.vpc_id
  target_type = "ip" # type "ip" for awsvpc network mode
}

