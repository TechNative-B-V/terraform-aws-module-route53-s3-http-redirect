module "redirect_technative_nl_techdd" {
  source = "Technative-B-V/terraform-aws-route53-s3-http-redirect/aws"
  version = "0.1.0"

  zone_name = "example.com" # THIS ZONE SHOULD EXIST IN ROUTE53
  domain_name = "sample-google-form.example.com"
  redirect_target_url = "https://docs.google.com/forms/d/e/1FAIpQLSeI8_vYyaJgM7SJM4Y9AWfLq-tglWZh6yt7bEXEOJr_L-hV1A/viewform?formkey=dGx0b1ZrTnoyZDgtYXItMWVBdVlQQWc6MQ"
}

