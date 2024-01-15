locals {
  has_domain = var.domain != ""
  domain     = local.has_domain ? var.domain : random_pet.website.id

  common_tags = {
    Project   = "AWS course with Terraform"
    Service   = "Static website"
    CreatedAt = timestamp()
  }
}