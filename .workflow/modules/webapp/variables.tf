# variable "bucket_prefix" {
#   type        = string
#   description = "prefix of s3 bucket for an app"
# }

variable "domain" {
  type        = string
  description = "domain of the app that also becomes a bucket name"
}

variable "environment_name" {
  description = "Deployment environment (dev/prod)"
  type        = string
  default     = "prod"
}

variable "create_dns_zone" {
  description = "if true, create new route53 zone, if false, read existing one"
  type        = bool
  default     = false
}
