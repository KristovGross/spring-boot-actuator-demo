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
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR principal de la VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDRs de subredes publicas"
  type        = list(string)

  default = [
    "10.10.1.0/24",
    "10.10.2.0/24"
  ]
}

variable "private_subnet_cidrs" {
  description = "CIDRs de subredes privadas"
  type        = list(string)

  default = [
    "10.10.11.0/24",
    "10.10.12.0/24"
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
  description = "Tag de la imagen Docker que sera desplegada en ECS"
  type        = string
  default     = "bootstrap"
}