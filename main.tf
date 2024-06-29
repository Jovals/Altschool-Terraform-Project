# Creating/Running the AWS bucket module
module "aws_s3_bucket" {
  source="./module_s3_bucket"
  aws_s3_bucket = var.aws_s3_bucket
  origin_id = ""
}

# Creating Cloudfront distribution
module "aws_cloudfront" {
  source="./module_cloudfront"
  aws_s3_bucket_name = module.aws_s3_bucket.aws_s3_bucket
  origin_id = module.aws_s3_bucket.origin_id
  domain_name = var.domain_name
  aws_s3_bucket_domain_name = module.aws_s3_bucket.bucket_domain_name
  acm_certificate = module.certificate.acm_certificate.arn
}
# Creating Route53 module
module "route53" {
  source = "./module_Route53"
  domain_name = var.domain_name
  cloudfront_domain_name =  module.aws_cloudfront.domain_name
  cloudfront_hosted_zone_id =  module.aws_cloudfront.zone_id
  # 
  env = var.env
}

# Creating Certificate module
module "certificate" {
  source = "./module_certificate"
  domain_name = var.domain_name
  aws_route53_zone_id = module.route53.module_Route53.zone_id

}






# module "certificate" {
#   source = "./module_certificate"
#   domain_name = var.domain_name
#   validation_record_fqdns = module.route53.validation_record_fqdns
# }