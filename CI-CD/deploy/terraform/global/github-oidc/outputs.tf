output "github_actions_role_arn" {
  description = "IAM Role de GitHub Actions mediante OIDC"
  value       = aws_iam_role.github_actions_deploy.arn
}

output "github_oidc_provider_arn" {
  description = "ARN del GitHub OIDC Provider"
  value       = aws_iam_openid_connect_provider.github.arn
}

output "github_oidc_subject" {
  description = "GitHub OIDC subject autorizado"
  value       = local.github_oidc_subject
}