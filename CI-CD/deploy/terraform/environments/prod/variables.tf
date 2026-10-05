variable "aws_region" {
  description = "Region AWS"
  type        = string
  default     = "us-east-2"
}

variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
  default     = "liverpool-actuator"
}

variable "environment" {
  description = "Ambiente"
  type        = string
  default     = "prod"
}

variable "vpc_cidr" {
  description = "CIDR principal de la VPC"
  type        = string
  default     = "10.30.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDRs de subredes publicas"
  type        = list(string)

  default = [
    "10.30.1.0/24",
    "10.30.2.0/24"
  ]
}

variable "private_subnet_cidrs" {
  description = "CIDRs de subredes privadas"
  type        = list(string)

  default = [
    "10.30.11.0/24",
    "10.30.12.0/24"
  ]
}

variable "availability_zones" {
  description = "Zonas de disponibilidad"
  type        = list(string)

  default = [
    "us-east-2a",
    "us-east-2b"
  ]
}

variable "image_tag" {
  description = "Tag inmutable de la imagen Docker que sera desplegada en ECS"
  type        = string

  validation {
    condition     = length(trimspace(var.image_tag)) > 0
    error_message = "image_tag debe contener un tag de imagen valido."
  }
}