variable "zone_name" {
  description = "Domain name of the Route53 hosted zone"
  type        = string
}

variable "domain_name" {
  description = "Domain to provide the redirect including subdomain if applicable"
  type        = string
}

variable "redirect_target_url" {
  description = "Redirect target - should be a full URL. If http:// or https:// is excluded, the scheme of the request will be used"
  type        = string
}

