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