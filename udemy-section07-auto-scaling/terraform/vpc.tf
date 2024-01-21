resource "aws_vpc" "this" {
  cidr_block = "192.168.0.0/16"
  tags       = merge(local.common_tags, { Name = "Terraform VPC" })
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags   = merge(local.common_tags, { Name = "Terraform Internet Gateway" })
}

resource "aws_subnet" "this" {
  for_each = {
    "pub_a" : ["192.168.1.0/24", "${var.aws_region}a", "Terraform Public Subnet A"],
    "pub_b" : ["192.168.2.0/24", "${var.aws_region}b", "Terraform Public Subnet B"],
    "pvt_a" : ["192.168.3.0/24", "${var.aws_region}a", "Terraform Private Subnet A"],
    "pvt_b" : ["192.168.4.0/24", "${var.aws_region}b", "Terraform Private Subnet B"],
  }

  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value[0]
  availability_zone = each.value[1]
  tags              = merge(local.common_tags, { Name = each.value[2] })
}
