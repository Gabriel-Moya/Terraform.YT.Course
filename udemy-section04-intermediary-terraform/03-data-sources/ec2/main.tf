terraform {
  required_version = "0.14.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.23.0"
    }
  }

  # terraform init -backend=true -backend-config="backend.hcl"
  backend "s3" {}
}

provider "aws" {
  region = "us-east-1"
}