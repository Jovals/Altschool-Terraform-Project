variable "domain_name" {
  description = "The domain name"
  
}


variable "origin_id" {
   description = "The hosted zone of the CloudFront distribution"
   
 }

variable "aws_s3_bucket_domain_name" {
  description = "The domain name of the S3 bucket"
  
}

variable "acm_certificate" {
  description = "The ARN of the ACM certificate"
  
}

variable "aws_s3_bucket_name" {
  description = "The name of the S3 bucket"
  
}


# variable "certificate_arn" {}
# # variable "s3_bucket_arn" {
# #   description = "The ARN of the S3 bucket"
# #   
# # }

# variable "s3_bucket_regional_domain_name" {
#   description = "The regional domain name of the S3 bucket"
#   
# }