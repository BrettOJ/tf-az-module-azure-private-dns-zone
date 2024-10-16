## for private endpoint DNS zone names please refer the Microsoft documentation

https://learn.microsoft.com/en-us/azure/private-link/private-endpoint-dns#virtual-network-and-on-premises-workloads-using-a-dns-forwarder


Enables you to manage Private DNS zones within Azure DNS. These zones are hosted on Azure's name servers.

## [Example Usage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#example-usage)

```hcl
resource "azurerm_resource_group" "example" { name = "example-resources" location = "West Europe" } resource "azurerm_private_dns_zone" "example" { name = "mydomain.com" resource_group_name = azurerm_resource_group.example.name }
```

## [Argument Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#argument-reference)

The following arguments are supported:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#name) - (Required) The name of the Private DNS Zone. Must be a valid domain name. Changing this forces a new resource to be created.

-   [`resource_group_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#resource_group_name) - (Required) Specifies the resource group where the resource exists. Changing this forces a new resource to be created.
    
-   [`soa_record`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#soa_record) - (Optional) An `soa_record` block as defined below. Changing this forces a new resource to be created.
    
-   [`tags`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#tags) - (Optional) A mapping of tags to assign to the resource.
    

___

The `soa_record` block supports:

-   [`email`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#email) - (Required) The email contact for the SOA record.
    
-   [`expire_time`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#expire_time) - (Optional) The expire time for the SOA record. Defaults to `2419200`.
    
-   [`minimum_ttl`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#minimum_ttl) - (Optional) The minimum Time To Live for the SOA record. By convention, it is used to determine the negative caching duration. Defaults to `10`.
    
-   [`refresh_time`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#refresh_time) - (Optional) The refresh time for the SOA record. Defaults to `3600`.
    
-   [`retry_time`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#retry_time) - (Optional) The retry time for the SOA record. Defaults to `300`.
    
-   [`ttl`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#ttl) - (Optional) The Time To Live of the SOA Record in seconds. Defaults to `3600`.
    
-   [`tags`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#tags) - (Optional) A mapping of tags to assign to the Record Set.
    

## [Attributes Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#attributes-reference)

In addition to the Arguments listed above - the following Attributes are exported:

-   [`id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#id) - The Private DNS Zone ID.
-   [`soa_record`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#soa_record) - A `soa_record` block as defined below.
-   [`number_of_record_sets`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#number_of_record_sets) - The current number of record sets in this Private DNS zone.
-   [`max_number_of_record_sets`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#max_number_of_record_sets) - The maximum number of record sets that can be created in this Private DNS zone.
-   [`max_number_of_virtual_network_links`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#max_number_of_virtual_network_links) - The maximum number of virtual networks that can be linked to this Private DNS zone.
-   [`max_number_of_virtual_network_links_with_registration`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#max_number_of_virtual_network_links_with_registration) - The maximum number of virtual networks that can be linked to this Private DNS zone with registration enabled.

___

A `soa_record` block exports the following:

-   [`fqdn`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#fqdn) - The fully qualified domain name of the Record Set.
    
-   [`host_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#host_name) - The domain name of the authoritative name server for the SOA record.
    
-   [`serial_number`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#serial_number) - The serial number for the SOA record.
    

## [Timeouts](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#timeouts)

The `timeouts` block allows you to specify [timeouts](https://www.terraform.io/language/resources/syntax#operation-timeouts) for certain actions:

-   [`create`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#create) - (Defaults to 30 minutes) Used when creating the Private DNS Zone.
-   [`update`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#update) - (Defaults to 30 minutes) Used when updating the Private DNS Zone.
-   [`read`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#read) - (Defaults to 5 minutes) Used when retrieving the Private DNS Zone.
-   [`delete`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#delete) - (Defaults to 30 minutes) Used when deleting the Private DNS Zone.

## [Import](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone#import)

Private DNS Zones can be imported using the `resource id`, e.g.

```shell
terraform import azurerm_private_dns_zone.zone1 /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mygroup1/providers/Microsoft.Network/privateDnsZones/zone1
```