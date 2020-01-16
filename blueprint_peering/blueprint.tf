
provider "azurerm" {
    alias = "hubsubscription"
    subscription_id = #"pull from output of remote network module"
}

resource "azures_virtual_network_peering" "peering_hub_to_Spoke" {
  #depends_on                    = [ module.hub_network ]

  name                          = "hub_to_Spoke"
  resource_group_name           = #var.virtual_network_rg.names["HUB-CORE-NET"] update to module hub_networking  
  virtual_network_name          = #var.shared_services_vnet_object.vnet_name  update to module hub_networking
  remote_virtual_network_id     = #module.networking_transit_vnet.vnet_obj.id
  allow_virtual_network_access  = true
  allow_forwarded_traffic       = true
  allow_gateway_transit         = true
  provider = "azurerm.hubsubscription"
}

resource "azurerm_virtual_network_peering" "peering_spoke_to_hub" {
 
 
  name                          = "spoke_to_hub"
  resource_group_name           = var.re
  virtual_network_name          = module.networking_transit_vnet.vnet_obj.name
  remote_virtual_network_id     = var.hub_network.hub_networking_object.vnet_id
  allow_virtual_network_access  = true
  allow_forwarded_traffic       = true
}
