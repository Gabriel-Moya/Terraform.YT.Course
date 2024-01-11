terraform {
  required_version = "0.14.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.23.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "bucket-for-remote-state" {
  bucket = "tfstate-bucket-${data.aws_caller_identity.current.account_id}"

  versioning {
    enabled = true
  }

  tags = {
    Description = "Bucket for remote state"
    ManagedBy   = "Terraform"
    Owner       = "Gabriel Moya"
    CreatedAt   = "2024-01-09"
    Classroom   = "udemy"
    Lesson      = "01-00-remote-state"
  }
}

resource "aws_dynamodb_table" "lock-table-tfstate" {
  name           = "tflock-${aws_s3_bucket.bucket-for-remote-state.bucket}"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

output "remote_state_bucket" {
  value = aws_s3_bucket.bucket-for-remote-state.bucket
}

output "remote_state_bucket_arn" {
  value = aws_s3_bucket.bucket-for-remote-state.arn
}