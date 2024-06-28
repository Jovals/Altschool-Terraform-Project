# S3 Bucket Creation
resource "aws_s3_bucket" "jovals-bucket-12345" {
  bucket = var.aws_s3_bucket
  force_destroy = true
}
# S3 Bucket Website Configuration
resource "aws_s3_bucket_website_configuration" "jovals-bucket-12345" {
  bucket = aws_s3_bucket.jovals-bucket-12345.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# # S3 Bucket Versioning Configuration
# resource "aws_s3_bucket_versioning" "kene_bucket-12345" {
#   bucket = aws_s3_bucket.jovals-bucket-12345.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# Public Access Blocking 
resource "aws_s3_bucket_public_access_block" "jovals-bucket-12345" {
  bucket = aws_s3_bucket.jovals-bucket-12345.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# S3 Bucket Lifecycle Configuration
resource "aws_s3_bucket_lifecycle_configuration" "kene_bucket-12345" {
  bucket = aws_s3_bucket.jovals-bucket-12345.id

  rule {
    id     = "log-expiration"
    status = "Enabled"

    filter {
      prefix = "log/"
    }

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 180
      storage_class = "GLACIER"
    }
  }
}
resource "aws_s3_object" "Terraform_Ass_Website" {
  for_each    = fileset("module_s3_bucket/Terraform_Ass_Website/", "**/*.*")
  bucket      = aws_s3_bucket.jovals-bucket-12345.bucket
  key         = each.value
  source      = "module_s3_bucket/Terraform_Ass_Website/${each.value}"
  content_type = "text/html"
}

# S3 Bucket Policy
resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.jovals-bucket-12345.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}

data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.jovals-bucket-12345.arn,
      "${aws_s3_bucket.jovals-bucket-12345.arn}/*",
    ]
  }
}