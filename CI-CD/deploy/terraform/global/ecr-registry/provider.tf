provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project   = "liverpool-actuator"
      ManagedBy = "Terraform"
      Scope     = "Global"
    }
  }
}