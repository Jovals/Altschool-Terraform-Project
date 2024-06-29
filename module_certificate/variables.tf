variable "domain_name" {
  description = "The domain name for the certificate"
  type        = string
}

# variable "validation_record_fqdns" {
#   description = "List of FQDNs for domain validation"
#   type        = list(string)
# }
variable "aws_route53_zone_id" {
  description = "The Route 53 zone ID for the domain"
  type        = string
  
}