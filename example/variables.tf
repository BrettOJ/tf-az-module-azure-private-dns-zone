variable "resource_group_name" {
  description = "The name of the resource group in which to create the Private DNS Zone."
}

variable "location" {
  description = "The location/region where the resource group will be created."
}


variable "domain_name" {
  description = "The name of the Private DNS Zone."
  
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