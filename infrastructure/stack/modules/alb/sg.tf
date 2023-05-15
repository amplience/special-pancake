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

  egress {
    description = "allow out to anywhere FIXME this should be narrowed down to at least the vpn subnets"
    protocol         = "-1"
    from_port        = 0
    to_port          = 0
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
