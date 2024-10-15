variable "resource_group_name" {
  description = "The name of the resource group in which to create the Private DNS Zone."
}

variable "location" {
  description = "The location/region where the resource group will be created."
}


variable "domain_name" {
  description = "The name of the Private DNS Zone."
  
}