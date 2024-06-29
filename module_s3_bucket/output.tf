output "aws_s3_bucket" {
  value = aws_s3_bucket.jovals-bucket-12345
}
# output "origin_id" {
#   value = aws_s3_bucket.origin_id
  
# }
output "aws_s3_object" {
  value=aws_s3_object.Terraform_Ass_Website
}
output "bucket_domain_name" {
  value = aws_s3_bucket.jovals-bucket-12345
}
output "s3_bucket_arn" {
  value = aws_s3_bucket.jovals-bucket-12345.arn
}

output "origin_id" {
  value = aws_s3_bucket.jovals-bucket-12345.id
}