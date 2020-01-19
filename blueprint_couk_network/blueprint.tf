########################
# Resource Group modules
########################

module "couk_resource_groups" {
    source  = "aztfmod/caf-resource-group/azurerm"
    version = "0.1.1"
    
    prefix                  = var.prefix
    resource_groups         = var.couk_resource_groups
    tags                    = var.tags
}

######################
# local values
######################

locals {
  COUK-NET-RG = module.couk_resource_groups.names.couk_network
  COUK-NET-LOCATION = module.couk_resource_groups.object.couk_network.location
}



#######################
# Network Module
#######################

module "couk_network" {
    source  = "aztfmod/caf-virtual-network/azurerm"
    version = "0.2.0"

    virtual_network_rg                = local.COUK-NET-RG
    location                          = local.COUK-NET-LOCATION
    networking_object                 = var.couk_network
    tags                              = var.tags
    diagnostics_map                   = var.diagnostics_map
    diagnostics_settings              = var.diagnostics_settings
    log_analytics_workspace           = var.log_analytics_workspace
    prefix                            = var.prefix
}


