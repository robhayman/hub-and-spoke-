########################
# Resource Group modules
########################

module "hub_resource_groups" {
    source  = "aztfmod/caf-resource-group/azurerm"
    version = "0.1.1"
    
    prefix                  = var.prefix
    resource_groups         = var.hub_resource_groups
    tags                    = var.tags
}

######################
# local values
######################

locals {
  HUB-NET-RG = module.hub_resource_groups.names.shared_services_network
  HUB-NET-LOCATION = module.hub_resource_groups.object.shared_services_network.location
}


#######################
# Network Module
#######################

module "hub_networking" {
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


# ######################
# # GATEWAY VARIABLES
# ######################


module "ER_gateway" {
  source = "./er_gateway"
  
  provision_gateway                   = var.provision_gateway
  location                            = local.HUB-NET-LOCATION
  resource_group_name                 = local.HUB-NET-RG
  tags                                = var.tags
  gateway_config                      = var.gateway_config
  remote_network                      = var.remote_network
  remote_network_connect              = var.remote_network_connect
  connection_name                     = var.connection_name
  gateway_subnet                      = module.hub_networking.vnet_subnets["GatewaySubnet"]
  diagnostics_map                     = var.diagnostics_map
  log_analytics_workspace             = var.log_analytics_workspace
  diagnostics_settings                = var.gateway_config.diagnostics
  er_ip_addr_config                   = var.er_ip_addr_config
}


# #####################
# # Public IP gateway
# ######################

# module "networking_hub_gateway_public_ip" {
#   source  = "aztfmod/caf-public-ip/azurerm"
#   version = "0.1.3"

#   name                             = var.er_ip_addr_config.name
#   location                         = local.HUB-NET-LOCATION
#   rg                               = local.HUB-NET-RG
#   ip_addr                          = var.er_ip_addr_config
#   tags                             = var.tags
#   diagnostics_map                  = var.diagnostics_map
#   log_analytics_workspace_id       = var.log_analytics_workspace.id
#   diagnostics_settings             = var.er_ip_addr_config.diagnostics
# }