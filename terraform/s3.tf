resource "aws_s3_bucket_acl" "my_bucket_acl" {
  bucket = aws_s3_bucket.my_bucket.id
  description = "Bucket ACL"
  type        =  string
  default     = "private"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-bucket"
  acl = aws_s3_bucket_acl.my_bucket_acl.arn
}

output "s3_bucket_name" {
  value = aws_s3_bucket.my_bucket.id
}
