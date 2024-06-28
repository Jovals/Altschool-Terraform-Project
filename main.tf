# Creating/Running the AWS bucket module
module "aws_s3_bucket" {
  source= "./module_s3_bucket"
  aws_s3_bucket = var.aws_s3_bucket
  origin_id = ""
}

# Creating Cloudfront distribution
module "aws_cloudfront" {
  source="./module_cloudfront"
  aws_s3_bucket = module.aws_s3_bucket.aws_s3_bucket
  certificate_arn = "default"
  origin_id = "s3-jovals-bucket-12345"
}
# module "route53" {
#   source = "./modules/route53"
#   domain-name = var.domain-name
#   env = var.env
#   cloudfront_domain_name = module.aws_cloudfront.aws_cloudfront.domain_name
#   cloudfront_hosted_zone_id = module.aws_cloudfront.aws_cloudfront.hosted_zone_id
  
# }

# module "certificate" {
#   source = "./modules/certificate"
#   domain-name = var.domain-name
#   aws_route53_zone_id=module.route53.route53.zone_id
# }