variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
}

variable "environment" {
  description = "Ambiente"
  type        = string
}

variable "aws_region" {
  description = "Region AWS"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}

variable "subnet_ids" {
  description = "Subredes utilizadas por ECS"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "Security Group del ALB"
  type        = string
}

variable "target_group_arn" {
  description = "ARN del Target Group"
  type        = string
}

variable "ecr_repository_url" {
  description = "URL del repositorio ECR"
  type        = string
}

variable "cloudwatch_log_group_name" {
  description = "Nombre del CloudWatch Log Group"
  type        = string
}

variable "container_name" {
  description = "Nombre del contenedor"
  type        = string
  default     = "actuator-demo"
}

variable "container_port" {
  description = "Puerto del contenedor"
  type        = number
  default     = 8080
}

variable "task_cpu" {
  description = "CPU asignada a la tarea Fargate"
  type        = number
  default     = 256
}

variable "task_memory" {
  description = "Memoria asignada a la tarea Fargate"
  type        = number
  default     = 512
}

variable "desired_count" {
  description = "Numero deseado de tareas"
  type        = number
  default     = 1
}

variable "assign_public_ip" {
  description = "Asignar IP publica a las tareas"
  type        = bool
  default     = true
}

variable "image_tag" {
  description = "Etiqueta de la imagen Docker desplegada"
  type        = string
}