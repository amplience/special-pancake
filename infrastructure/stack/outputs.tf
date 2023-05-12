output "app_endpoint" {
  value = "http://${module.alb.lb_dns_name}:${var.app_port}"
}
