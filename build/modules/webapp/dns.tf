resource "aws_route53_zone" "primary" {
  count = var.create_dns_zone ? 1 : 0
  name  = var.domain
}

data "aws_route53_zone" "primary" {
  count = var.create_dns_zone ? 0 : 1
  name  = var.domain
}

locals {
  dns_zone_id = var.create_dns_zone ? aws_route53_zone.primary[0].name : data.aws_route53_zone.primary[0].zone_id
  subdomain   = var.environment_name == "prod" ? "" : "${var.environment_name}."
}

resource "aws_route53_record" "root" {
  zone_id = local.dns_zone_id
  name    = "${local.subdomain}${var.domain}"
  type    = "A"
  alias {
    name                   = aws_cloudfront_distribution.s3_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
    evaluate_target_health = true
  }
}
