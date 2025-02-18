variable "domain_name" {
  description = "The name of the Private DNS Zone."
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Private DNS Zone."
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
}

variable "soa_record" {
  description = "The SOA record for the Private DNS Zone."
  type = object({
    email        = string
    expire_time  = number
    minimum_ttl  = number
    refresh_time = number
    retry_time   = number
    ttl          = number
    tags         = map(string)
  })
  default = null
  
}

variable "dns_a_record" {
  description = "The A record for the Private DNS Zone."
  type = map(object({
    name                = string
    zone_name           = string
    resource_group_name = string
    ttl                 = number
    records             = list(string)
  }))
  default = null
}