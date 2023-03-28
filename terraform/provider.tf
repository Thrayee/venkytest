provider "aws" {
  region  = var.aws_region

  # You can use access keys
  access_key = var.AWS_ACCESS_KEY_ID
  aws_secret_access_key = var.AWS_SECRET_ACCESS_KEY

  # Or specify an aws profile, instead.
  # profile = "<aws profile>"
}