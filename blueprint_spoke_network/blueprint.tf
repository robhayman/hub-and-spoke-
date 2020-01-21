########################
# Resource Group modules
########################

module "spoke_resource_groups" {
    source  = "aztfmod/caf-resource-group/azurerm"
    version = "0.1.1"
    
    prefix                  = var.prefix
    resource_groups         = var.spoke_resource_groups
    tags                    = var.tags
}

######################
# local values
######################

locals {
  spoke-NET-RG = module.spoke_resource_groups.names.spoke_network
  spoke-NET-LOCATION = module.spoke_resource_groups.object.spoke_network.location
}



#######################
# Network Module
#######################

module "spoke_network" {
    source  = "aztfmod/caf-virtual-network/azurerm"
    version = "0.2.0"

    virtual_network_rg                = local.spoke-NET-RG
    location                          = local.spoke-NET-LOCATION
    networking_object                 = var.spoke_network
    tags                              = var.tags
    diagnostics_map                   = var.diagnostics_map
    diagnostics_settings              = var.diagnostics_settings
    log_analytics_workspace           = var.log_analytics_workspace
    prefix                            = var.prefix
}


