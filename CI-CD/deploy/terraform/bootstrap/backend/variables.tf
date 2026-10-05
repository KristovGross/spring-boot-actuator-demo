variable "aws_region" {
  description = "Region AWS donde se almacenara el Terraform State"
  type        = string
  default     = "us-east-2"
}

variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
  default     = "liverpool-actuator"
}