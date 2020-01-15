########################
# Resource Group modules
########################

module "resource_groups" {
    source  = "aztfmod/caf-resource-group/azurerm"
    version = "0.1.1"
    
    prefix                  = var.prefix
    resource_groups         = var.resource_groups
    tags                    = var.tags
}

######################
# local values
######################

locals {
  HUB-NET-RG = lookup(module.resource_groups.names.hub_network, "name", null)
  HUB-NET-LOCATION = lookup(module.resource_groups.names.hub_network, "location", null )
}



#######################
# Network Module
#######################

module "virtual_network" {
    source  = "aztfmod/caf-virtual-network/azurerm"
    version = "0.2.0"

    virtual_network_rg                = local.HUB-NET-RG
    location                          = local.HUB-NET-LOCATION
    networking_object                 = var.hub_networking_object
    tags                              = var.tags
    diagnostics_map                   = var.diagnostics_map
    diagnostics_settings              = var.diagnostics_settings
    log_analytics_workspace           = var.log_analytics_workspace
    prefix                            = var.prefix
}


