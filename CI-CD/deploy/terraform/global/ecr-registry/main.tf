resource "aws_ecr_registry_scanning_configuration" "main" {
  scan_type = "BASIC"

  rule {
    scan_frequency = "SCAN_ON_PUSH"

    repository_filter {
      filter      = "liverpool-actuator-*"
      filter_type = "WILDCARD"
    }
  }
}