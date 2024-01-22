variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = number
}

variable "service_name" {
  description = "value of the Service name"
  type        = string
  default     = "autoscaling-app"
}

variable "instance_type" {
  description = "value of the instance type"
  type        = string
  default     = "t3.micro"
}

variable "instance_key_name" {
  description = "value of the key name"
  type        = string
  default     = "terraform-course-temp"
}
