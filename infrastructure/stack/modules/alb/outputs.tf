output "lb_dns_name" {
  value = aws_lb.main.dns_name
}

output "target_group_arn" {
  value = aws_alb_target_group.main.arn
}

output "sg_id" {
    value = aws_security_group.load_balancer_sg.id
}