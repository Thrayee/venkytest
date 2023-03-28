provider "aws" {
  region  = var.aws_region

  # You can use access keys
  TF_VAR_AWS_ACCESS_KEY_ID = var.AWS_ACCESS_KEY_ID
  TF_VAR_AWS_SECRET_ACCESS_KEY = var.AWS_ACCESS_KEY_ID

  # Or specify an aws profile, instead.
  # profile = "<aws profile>"
}