output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.network.private_subnet_ids
}

output "ecr_repository_name" {
  description = "Nombre del repositorio ECR"
  value       = module.ecr.repository_name
}

output "ecr_repository_url" {
  description = "URL del repositorio ECR"
  value       = module.ecr.repository_url
}

output "alb_dns_name" {
  description = "DNS publico del Application Load Balancer"
  value       = module.alb.alb_dns_name
}

output "alb_target_group_arn" {
  description = "Target Group utilizado por ECS"
  value       = module.alb.target_group_arn
}

output "alb_security_group_id" {
  description = "Security Group del ALB"
  value       = module.alb.alb_security_group_id
}

output "ecs_cluster_name" {
  description = "Nombre del cluster ECS"
  value       = module.ecs.cluster_name
}

output "ecs_service_name" {
  description = "Nombre del servicio ECS"
  value       = module.ecs.service_name
}

output "ecs_task_definition_arn" {
  description = "Task Definition utilizada"
  value       = module.ecs.task_definition_arn
}

output "cloudwatch_log_group_name" {
  description = "CloudWatch Log Group de ECS"
  value       = module.monitoring.log_group_name
}