output "cluster_name" {
  description = "Nombre del cluster ECS"
  value       = aws_ecs_cluster.main.name
}

output "cluster_arn" {
  description = "ARN del cluster ECS"
  value       = aws_ecs_cluster.main.arn
}

output "service_name" {
  description = "Nombre del servicio ECS"
  value       = aws_ecs_service.app.name
}

output "service_id" {
  description = "ID del servicio ECS"
  value       = aws_ecs_service.app.id
}

output "task_definition_arn" {
  description = "ARN de la Task Definition"
  value       = aws_ecs_task_definition.app.arn
}

output "ecs_security_group_id" {
  description = "Security Group utilizado por ECS"
  value       = aws_security_group.ecs.id
}

output "task_execution_role_arn" {
  description = "ARN del Task Execution Role"
  value       = aws_iam_role.ecs_task_execution.arn
}