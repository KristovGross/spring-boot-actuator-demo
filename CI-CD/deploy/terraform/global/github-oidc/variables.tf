variable "aws_region" {
  description = "Region AWS utilizada por GitHub Actions"
  type        = string
  default     = "us-east-2"
}

variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
  default     = "liverpool-actuator"
}

variable "github_owner" {
  description = "Propietario del repositorio GitHub"
  type        = string
  default     = "KristovGross"
}

variable "github_owner_id" {
  description = "ID inmutable del propietario GitHub"
  type        = string
  default     = "61365591"
}

variable "github_repository" {
  description = "Nombre del repositorio GitHub"
  type        = string
  default     = "spring-boot-actuator-demo"
}

variable "github_repository_id" {
  description = "ID inmutable del repositorio GitHub"
  type        = string
  default     = "1403876452"
}

variable "deployment_branch" {
  description = "Branch autorizado para asumir el IAM Role"
  type        = string
  default     = "main"
}