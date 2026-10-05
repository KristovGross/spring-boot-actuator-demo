output "log_group_name" {
  description = "Nombre del Log Group utilizado por ECS"
  value       = aws_cloudwatch_log_group.ecs.name
}

output "log_group_arn" {
  description = "ARN del Log Group"
  value       = aws_cloudwatch_log_group.ecs.arn
}