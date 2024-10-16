resource "azurerm_private_dns_zone" "azure_prv_dns" {
  name                = var.domain_name
  resource_group_name = var.resource_group_name
  tags                = var.tags
  dynamic soa_record {
    for_each = var.soa_record != null ? [var.soa_record] : []
    content {
      email        = soa_record.value.email
      expire_time  = soa_record.value.expire_time
      minimum_ttl  = soa_record.value.minimum_ttl
      refresh_time = soa_record.value.refresh_time
      retry_time   = soa_record.value.retry_time
      ttl          = soa_record.value.ttl
      tags         = soa_record.value.tags
    }
  }
}

resource "azurerm_private_dns_a_record" "pvt_dns_a_record" {
  for_each = var.dns_a_record != null ? var.dns_a_record : {}
  name                = var.dns_a_record[each.key].name
  zone_name           = var.dns_a_record[each.key].zone_name
  resource_group_name = var.dns_a_record[each.key].resource_group_name
  ttl                 = var.dns_a_record[each.key].ttl
  records             = var.dns_a_record[each.key].records
  
  depends_on = [ azurerm_private_dns_zone.azure_prv_dns ]
}
