variable "environment" {
  type        = string
  description = "Environment"
  default     = "dev"
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "instance_ami" {
  type        = string
  description = "Instance EC2"
}

variable "instance_type" {
  type        = string
  description = "Instance EC2 type"
}

variable "instance_tags" {
  type        = map(string)
  description = ""
  default = {
    Name    = "Ubuntu"
    Project = "Course AWS with terraform"
  }
}
