# resource "aws_s3_bucket" "jovals-bucket-12345" {
#   bucket = "jovals-bucket-12345"
#   force_destroy = true
  
# }


resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = var.aws_s3_bucket.bucket_regional_domain_name
    origin_id   = "s3-jovals-bucket-12345"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

 # aliases = ["www.example.com"]  # Replace with your domain name

  default_cache_behavior {
    allowed_methods  =  ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "s3-jovals-bucket-12345"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"

    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  viewer_certificate {
    # acm_certificate_arn =  var.acm_certificate_arn
    # ssl_support_method = "sni-only"
    # minimum_protocol_version = "TLSv1.2_2021"
    cloudfront_default_certificate = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}

resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "OAI for jovals-bucket-12345"
}

#  Attach bucket policy to allow CloudFront access
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = var.aws_s3_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          AWS = aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn
        }
        Action = "s3:GetObject"
      Resource = [

        "${var.aws_s3_bucket.arn}/*"
        ]
      }
    ]
  })
}