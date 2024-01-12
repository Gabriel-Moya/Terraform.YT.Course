variable "name" {
  type        = string
  description = "Bucket name"
}

variable "acl" {
  type        = string
  description = "Access control list"
  default     = "private"
}

variable "policy" {
  type        = string
  description = "value of the bucket policy"
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "tags to apply to the bucket"
  default     = {}
}

variable "key_prefix" {
  type    = string
  default = ""
}

variable "files" {
  type    = string
  default = ""
}

variable "website" {
  description = "Map containing website configuration."
  type        = map(string)
  default     = {}
}

variable "versioning" {
  description = "Map containing versioning configuration."
  type        = map(string)
  default     = {}
}