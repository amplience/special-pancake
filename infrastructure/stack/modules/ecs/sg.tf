resource "aws_security_group" "ecs_tasks" {
  name   = "${var.name}-sg-task"
  vpc_id = var.vpc_id

  egress {
    description = "allow out on any port to anywhere"
    protocol         = "-1"
    from_port        = 0
    to_port          = 0
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

# separate sg group rule to break circular dep
resource "aws_security_group_rule" "allow_in_from_lb" {
    type = "ingress"
    description = "allow in from lb sg"
    security_group_id = aws_security_group.ecs_tasks.id
    protocol         = "tcp"
    from_port        = var.container_port
    to_port          = var.container_port

    source_security_group_id = var.lb_sg_id
}
