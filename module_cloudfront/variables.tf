variable "origin_id" {
  description = "value of the origin id"
}
# variable "domain_name" {
#   description = "value of the domain name"
#   type = string
# }
variable "aws_s3_bucket" {
  description = "value of the S3 bucket"
}

variable "certificate_arn" {}
# variable "s3_bucket_arn" {
#   description = "The ARN of the S3 bucket"
#   type        = string
# }

# variable "s3_bucket_regional_domain_name" {
#   description = "The regional domain name of the S3 bucket"
#   type        = string
# }