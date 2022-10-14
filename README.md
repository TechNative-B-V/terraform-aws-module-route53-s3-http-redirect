# terraform-aws-route53-s3-http-redirect ![](https://img.shields.io/github/workflow/status/TechNative-B-V/terraform-aws-route53-s3-http-redirect/Lint?style=plastic)

Implements creates a simple http url forwarding redirect using a route 53 alias
records and a s3 bucket.

This is the most simple method to create a HTTP redirect within AWS.

[![](we-are-technative.png)](https://www.technative.nl)

## How does it work

This module creates a S3 bucket and a Route 53 A record.

The S3 bucket is empty and has a website configuration which redirects all
traffic to the target url.

The Route 53 A record will alias to the S3 endpoint.

## Usage

```
module "redirect_technative_nl_techdd" {
  source = "Technative-B-V/terraform-aws-route53-s3-http-redirect/aws"
  version = "0.1.0"

  zone_name = "example.com" # THIS ZONE SHOULD EXIST IN ROUTE53
  domain_name = "sample-google-form.example.com"
  redirect_target_url = "https://docs.google.com/forms/d/e/1FAIpQLSeI8_vYyaJgM7SJM4Y9AWfLq-tglWZh6yt7bEXEOJr_L-hV1A/viewform?formkey=dGx0b1ZrTnoyZDgtYXItMWVBdVlQQWc6MQ"
}
```

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_route53_http_redirect_target_url"></a> [route53\_http\_redirect\_target\_url](#module\_route53\_http\_redirect\_target\_url) | TechNative-B-V/url-parser/null | 0.1.1 |

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.domains](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_s3_bucket.route53_http_redirect_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_website_configuration.route53_http_redirect_webconf](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration) | resource |
| [aws_route53_zone.route53_http_redirect_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain to provide the redirect including subdomain if applicable | `string` | n/a | yes |
| <a name="input_redirect_target_url"></a> [redirect\_target\_url](#input\_redirect\_target\_url) | Redirect target - should be a full URL. If http:// or https:// is excluded, the scheme of the request will be used | `string` | n/a | yes |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | Domain name of the Route53 hosted zone | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
