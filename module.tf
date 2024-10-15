resource "azurerm_private_dns_zone" "azure_prv_dns" {
  name                = var.domain_name
  resource_group_name = module.resource_groups.rg_output.1.name
  tags                = var.tags
  soa_record {
    email        = var.soa_record.email
    expire_time  = var.soa_record.expire_time
    minimum_ttl  = var.soa_record.minimum_ttl
    refresh_time = var.soa_record.refresh_time
    retry_time   = var.soa_record.retry_time
    ttl          = var.soa_record.ttl
    tags         = var.soa_record.tags
  }

}