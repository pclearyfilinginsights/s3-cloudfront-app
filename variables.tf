variable "fqdn" {
  type        = string
  description = "The FQDN of the website and also name of the S3 bucket"
  default     = "k8spc.com"
}

#variable "domain" {
#  description = "The domain name."
#  default     = "k8spc.com"
#}

variable "aliases" {
  type        = list(string)
  description = "Any other domain aliases to add to the CloudFront distribution"
  default     = []
}

variable "force_destroy" {
  type        = string
  description = "The force_destroy argument of the S3 bucket"
  default     = "false"
}

variable "ssl_certificate_arn" {
  type        = string
  description = "ARN of the certificate covering the fqdn and its apex?"
  default     = "arn:aws:acm:us-east-1:529692500209:certificate/4a966375-6ec4-4ddd-8cea-4fd022895fe9"
}

# Allowed IPs that can directly access the S3 bucket
variable "allowed_ips" {
  type = "list"
  default = [
    "0.0.0.0/0"            # public access
    # "xxx.xxx.xxx.xxx/mm" # restricted
    # "999.999.999.999/32" # invalid IP, completely inaccessible
  ]
}

variable "web_acl_id" {
  type        = string
  description = "WAF Web ACL ID to attach to the CloudFront distribution, optional"
  default     = ""
}

variable "refer_secret" {
  type        = string
  description = "A secret string to authenticate CF requests to S3"
  default     = "123-VERY-SECRET-123"
}

variable "routing_rules" {
  type        = string
  description = "Routing rules for the S3 bucket"
  default     = ""
}

variable "cloudfront_price_class" {
  type        = string
  description = "PriceClass for CloudFront distribution"
  default     = "PriceClass_100"
}

variable "index_document" {
  type        = string
  description = "HTML to show at root"
  default     = "index.html"
}

variable "error_document" {
  type        = string
  description = "HTML to show on 404"
  default     = "404.html"
}

variable "error_response_code" {
  type        = string
  description = "Response code to send on 404"
  default     = "404"
}

variable "spa_error_response_code" {
  type        = string
  description = "Response code to send on 404 for a single page application"
  default     = "200"
}

variable "tags" {
  type        = map(string)
  description = "Tags"
  default     = {}
}

# value should be  "${lambda.arn}:${lambda.version}"
variable "lambda_edge_arn_version" {
  default = ""
  type = string
}

variable "lambda_edge_enabled" {
  default = false
  type = bool
}

variable "cf_ipv6_enabled" {
  default = true
  type = bool
}

variable "single_page_application" {
  default = false
  type = bool
}
