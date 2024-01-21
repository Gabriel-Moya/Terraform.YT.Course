locals {
  subnet_ids = { for k, v in aws_subnet.this : v.tags.Name => v.id }

  common_tags = {
    Project   = "Course AWS with Terraform"
    CreatedAt = "2024-01-21"
    ManagedBy = "Terraform"
    Owner     = "Gabriel Moya"
    Service   = "Auto Scaling App"
  }
}