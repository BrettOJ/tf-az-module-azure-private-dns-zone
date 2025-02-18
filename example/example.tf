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
  dns_a_record = {
    1= {
      name                = "www"
      zone_name           = var.domain_name
      resource_group_name = module.resource_groups.rg_output.1.name
      ttl                 = 300
      records             = ["10.1.1.0"]
       }
    }
}