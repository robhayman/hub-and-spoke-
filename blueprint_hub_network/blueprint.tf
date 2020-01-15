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

module "hub_network" {
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



######################
# Firewall Module
######################

module "hub_network_azfirewall" {
  source  = "aztfmod/caf-azure-firewall/azurerm"
  version = "0.1.2"

  az_fw_name                        = var.az_fw_config.name
  az_fw_rg                          = local.HUB-NET-RG
  subnet_id                         = lookup(module.hub_network.vnet_subnets, "AzureFirewallSubnet", null)
  public_ip_id                      = module.hub_network_azfirewall_public_ip.id
  location                          = local.HUB-NET-LOCATION
  tags                              = var.tags
  diagnostics_map                   = var.diagnostics_map
  log_analytics_workspace_id        = var.log_analytics_workspace.id
  diagnostics_settings              = var.az_fw_config.diagnostics
}


#####################
# Public IP Firewall
######################

module "hub_network_azfirewall_public_ip" {
  source  = "aztfmod/caf-public-ip/azurerm"
  version = "0.1.3"

  name                             = var.fw_ip_addr_config.ip_name
  location                         = local.HUB-NET-LOCATION
  rg                               = local.HUB-NET-RG
  ip_addr                          = var.fw_ip_addr_config
  tags                             = var.tags
  diagnostics_map                  = var.diagnostics_map
  log_analytics_workspace_id       = var.log_analytics_workspace.id
  diagnostics_settings             = var.fw_ip_addr_config.diagnostics
}

#module "firewall_rules" {
# source = "./az_firewall_rules"
#  
#  az_firewall_settings                 = module.networking_shared_egress_azfirewall.az_firewall_config
#}

######################
# GATEWAY VARIABLES
######################


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
  public_ip_addr                      = module.networking_hub_gateway_public_ip.id
  gateway_subnet                      = module.hub_network.vnet_subnets["GatewaySubnet"]
  diagnostics_map                     = var.diagnostics_map
  log_analytics_workspace             = var.log_analytics_workspace
  diagnostics_settings                = var.gateway_config.diagnostics
  
}


#####################
# Public IP gateway
######################

module "networking_hub_gateway_public_ip" {
  source  = "aztfmod/caf-public-ip/azurerm"
  version = "0.1.3"

  name                             = var.er_ip_addr_config.name
  location                         = local.HUB-NET-LOCATION
  rg                               = local.HUB-NET-RG
  ip_addr                          = var.er_ip_addr_config
  tags                             = var.tags
  diagnostics_map                  = var.diagnostics_map
  log_analytics_workspace_id       = var.log_analytics_workspace.id
  diagnostics_settings             = var.er_ip_addr_config.diagnostics
}