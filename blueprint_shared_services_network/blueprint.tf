########################
# Resource Group modules
########################

module "shared_services_resource_groups" {
    source  = "aztfmod/caf-resource-group/azurerm"
    version = "0.1.1"
    
    prefix                  = var.prefix
    resource_groups         = var.shared_services_resource_groups
    tags                    = var.tags
}

######################
# local values
######################

locals {
  SHARED-SERVICES-NET-RG = module.shared_services_resource_groups.names.hub_network
  SHARED-SERVICES-LOCATION = module.shared_services_resource_groups.object.hub_network.location
}



#######################
# Network Module
#######################

module "shared_services_network" {
    source  = "aztfmod/caf-virtual-network/azurerm"
    version = "0.2.0"

    virtual_network_rg                = local.SHARED-SERVICES-NET-RG
    location                          = local.SHARED-SERVICES-NET-LOCATION
    networking_object                 = var.shared_services_network
    tags                              = var.tags
    diagnostics_map                   = var.diagnostics_map
    diagnostics_settings              = var.diagnostics_settings
    log_analytics_workspace           = var.log_analytics_workspace
    prefix                            = var.prefix
}


