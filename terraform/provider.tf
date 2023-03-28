provider "aws" {
  region  = var.aws_region

  # You can use access keys
  ACCESS_KEY_ID = var.AWS_ACCESS_KEY_ID
  AWS_SECRET_ACCESS_KEY = var.AWS_ACCESS_KEY_ID

  # Or specify an aws profile, instead.
  # profile = "<aws profile>"
}