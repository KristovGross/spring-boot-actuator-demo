variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
}

variable "environment" {
  description = "Ambiente de despliegue"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR de la VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDRs para subredes publicas"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDRs para subredes privadas"
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability Zones utilizadas"
  type        = list(string)
}