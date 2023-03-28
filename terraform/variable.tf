variable "AWS_ACCESS_KEY_ID" {
  description = "AWS access key"
  type = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS secret key"
  type = string
  
}

variable "aws_region" {
  default = "us-east-1"
  type = string
}