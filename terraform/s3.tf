terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

/* resource "aws_s3_bucket_acl" "my_bucket_acl" {
  bucket = aws_s3_bucket.my_bucket.id
  description = "Bucket ACL"
  type        =  string
  default     = "private"
} */

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-bucket"
  acl = "private"
}

output "s3_bucket_name" {
  value = aws_s3_bucket.my_bucket.id
}
