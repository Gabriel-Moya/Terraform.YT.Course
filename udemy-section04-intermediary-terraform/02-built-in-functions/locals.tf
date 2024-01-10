locals {
  instance_number = lookup(var.instance_number, var.env)

  file_ext    = "zip"
  object_name = "file-generated-from-a-template"

  common_tags = {
    Owner       = "Gabriel Moya"
    Environment = var.env
  }
}