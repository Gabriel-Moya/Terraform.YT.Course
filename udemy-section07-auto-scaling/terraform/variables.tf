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
