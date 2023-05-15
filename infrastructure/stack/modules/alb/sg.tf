resource "aws_security_group" "load_balancer_sg" {
  name = "${var.name}-sg-load-balancer"
  vpc_id = var.vpc_id

  ingress {
    description      = "allow in on app port from anywhere"
    protocol         = "tcp"
    from_port        = var.app_port
    to_port          = var.app_port
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

# separate sg group rule to break circular dep
resource "aws_security_group_rule" "allow_out_to_ecs" {
    type = "egress"
    description = "allow out to ecs task sg"
    security_group_id = aws_security_group.load_balancer_sg.id
    protocol         = "tcp"
    from_port        = var.app_port
    to_port          = var.app_port
    source_security_group_id = var.ecs_tasks_sg_id
}