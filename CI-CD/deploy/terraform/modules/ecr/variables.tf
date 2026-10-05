variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
}

variable "environment" {
  description = "Ambiente de despliegue"
  type        = string
}

variable "force_delete" {
  description = "Permite eliminar el repositorio aunque contenga imagenes"
  type        = bool
  default     = false
}