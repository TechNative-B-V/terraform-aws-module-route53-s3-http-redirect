data "aws_route53_zone" "route53_http_redirect_zone" {
  name = var.zone_name
}

resource "aws_s3_bucket" "route53_http_redirect_bucket" {
  bucket        = var.domain_name
  force_destroy = "true"
}

module "route53_http_redirect_target_url" {
  source  = "TechNative-B-V/url-parser/null"
  version = "0.1.1"

  url    = var.redirect_target_url
}

resource "aws_s3_bucket_website_configuration" "route53_http_redirect_webconf" {
  bucket = aws_s3_bucket.route53_http_redirect_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  routing_rules = <<EOF
[{
    "Redirect": {
        "HostName": "${module.route53_http_redirect_target_url.hostname}",
        "Protocol": "${module.route53_http_redirect_target_url.protocol}",
        "ReplaceKeyWith": "${module.route53_http_redirect_target_url.path_and_param}"
    }
}]
EOF
}

resource "aws_route53_record" "domains" {
  zone_id = data.aws_route53_zone.route53_http_redirect_zone.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_s3_bucket_website_configuration.route53_http_redirect_webconf.website_domain
    zone_id                = aws_s3_bucket.route53_http_redirect_bucket.hosted_zone_id
    evaluate_target_health = true
  }
}


