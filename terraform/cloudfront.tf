resource "aws_acm_certificate" "venkypoc" {
  domain_name = "venkypoc.link"
  subject_alternative_names = [
    "www.venkypoc.com",
    "devfe.venkypoc.com",
  ]
  validation_method = "DNS"
}


resource "aws_cloudfront_distribution" "my_distribution" {
  origin {
    domain_name = aws_s3_bucket.my_bucket.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.my_bucket.id
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.my_identity.cloudfront_access_identity_path
    }
  }

  viewer_certificate {
    acm_certificate_arn = aws_acm_certificate.venkypoc.arn"
    ssl_support_method  = "sni-only"
  }
}

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  default_cache_behavior {
    target_origin_id = aws_s3_bucket.my_bucket.id
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD", "OPTIONS"]

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    min_ttl = 0
    default_ttl = 3600
    max_ttl = 86400
  }

  price_class = "PriceClass_100"
}

resource "aws_cloudfront_origin_access_identity" "my_identity" {}

output "cloudfront_distribution_domain_name" {
  value = aws_cloudfront_distribution.my_distribution.domain_name
}
