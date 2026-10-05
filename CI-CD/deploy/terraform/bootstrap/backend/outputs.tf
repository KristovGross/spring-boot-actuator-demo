output "terraform_state_bucket_name" {
  description = "Nombre del bucket S3 utilizado para Terraform State"
  value       = aws_s3_bucket.terraform_state.bucket
}

output "terraform_state_bucket_arn" {
  description = "ARN del bucket S3 utilizado para Terraform State"
  value       = aws_s3_bucket.terraform_state.arn
}