output "alb_arn" {
  description = "ARN del Application Load Balancer"
  value       = aws_lb.main.arn
}

output "alb_dns_name" {
  description = "DNS publico del Application Load Balancer"
  value       = aws_lb.main.dns_name
}

output "alb_security_group_id" {
  description = "Security Group asociado al ALB"
  value       = aws_security_group.alb.id
}

output "target_group_arn" {
  description = "ARN del Target Group de la aplicacion"
  value       = aws_lb_target_group.app.arn
}