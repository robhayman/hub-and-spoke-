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
  SHARED-SERVICES-NET-RG = lookup(tomap(module.shared_services_resource_groups.names.shared_services_network), "name", null)
  SHARED-SERVICES-NET-LOCATION = lookup(tomap(module.shared_services_resource_groups.names.shared_services_network), "location", null )
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


