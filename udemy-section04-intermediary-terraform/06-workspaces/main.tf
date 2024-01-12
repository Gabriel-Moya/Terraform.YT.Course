terraform {
  required_version = "0.14.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.23.0"
    }
  }

  backend "s3" {
    bucket         = "tfstate-bucket-218439812752"
    key            = "06-workspaces/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tflock-tfstate-bucket-218439812752"
  }
}

provider "aws" {
  region  = lookup(var.aws_region, local.env)
}

locals {
  env = terraform.workspace == "default" ? "dev" : terraform.workspace
}

resource "aws_instance" "web" {
  count = lookup(var.instance, local.env)["number"]

  ami           = lookup(var.instance, local.env)["ami"]
  instance_type = lookup(var.instance, local.env)["type"]

  tags = {
    Name = "Minha máquina web ${local.env}"
    Env  = local.env
  }
}