resource "aws_vpc" "this" {
  cidr_block = "192.168.0.0/16"
  tags       = merge(local.common_tags, { Name = "Terraform VPC" })
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags   = merge(local.common_tags, { Name = "Terraform Internet Gateway" })
}

resource "aws_subnet" "public_a" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "192.168.0.0/24"
  availability_zone = "${var.aws_region}a"
  tags              = merge(local.common_tags, { Name = "Terraform Public Subnet A" })
}

resource "aws_subnet" "public_b" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "192.168.1.0/24"
  availability_zone = "${var.aws_region}b"
  tags              = merge(local.common_tags, { Name = "Terraform Public Subnet B" })
}

resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "192.168.2.0/24"
  availability_zone = "${var.aws_region}a"
  tags              = merge(local.common_tags, { Name = "Terraform Private Subnet A" })
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "192.168.3.0/24"
  availability_zone = "${var.aws_region}b"
  tags              = merge(local.common_tags, { Name = "Terraform Private Subnet B" })
}