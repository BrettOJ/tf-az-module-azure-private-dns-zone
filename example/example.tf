locals {
  naming_convention_info = {
    project_code = "project_code"
    env          = "env"
    zone         = "zone"
    tier         = "tier"
    name         = "name"
  }
  tags = {
    environment = "Production"
  }

}
module "resource_groups" {
  source = "git::https://github.com/BrettOJ/tf-az-module-resource-group?ref=main"
  resource_groups = {
    1 = {
      name                   = var.resource_group_name
      location               = var.location
      naming_convention_info = local.naming_convention_info
      tags                   = local.tags
    }
  }
}


module "azure_private_dns_zone" {
  source                 = "../"
  domain_name            = var.domain_name
  resource_group_name    = module.resource_groups.rg_output.1.name
  tags                   = local.tags
  naming_convention_info = local.naming_convention_info
  soa_record = {
    email        = "admin@mydomain.com"
    expire_time  = 3600
    minimum_ttl  = 300
    refresh_time = 3600
    retry_time   = 600
    ttl          = 300
    tags         = null
  }
}