locals {
  ip_filepath = "ips.json"

  common_tags = {
    service     = "Curso Terraform"
    ManagedBy   = "Terraform"
    Environment = var.environment
    Owner       = "Gabriel Moya"
  }
}