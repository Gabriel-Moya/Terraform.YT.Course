variable "env" {
  type        = string
  description = "Environment"
  default     = "dev"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_ami" {
  type        = string
  description = "AMI to use for the instance"
  default     = "ami-0c7217cdde317cfec"

  validation {
    condition     = length(var.instance_ami) > 4 && substr(var.instance_ami, 0, 4) == "ami-"
    error_message = "The instance_ami value must be a valid AMI ID, starting with \"ami-\"."
  }
}

variable "instance_type" {
  type = object({
    dev  = string
    prod = string
  })

  description = "Instance type"

  default = {
    dev  = "t2.micro"
    prod = "t2.medium"
  }
}

variable "instance_number" {
  type = object({
    dev  = string
    prod = string
  })

  description = "Number of instances to create"

  default = {
    dev  = 1
    prod = 3
  }
}