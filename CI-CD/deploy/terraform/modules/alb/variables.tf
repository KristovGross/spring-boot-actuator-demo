variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
}

variable "environment" {
  description = "Ambiente de despliegue"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "Subredes publicas donde se desplegara el ALB"
  type        = list(string)
}

variable "app_port" {
  description = "Puerto donde escucha la aplicacion"
  type        = number
  default     = 8080
}