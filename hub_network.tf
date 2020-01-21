module "blueprint_hub_network" {
    source = "./blueprint_hub_network"


# Resource groups variables

resource_groups                 = var.hub_resource_groups
location                        = var.location

# Network variables 

virtual_network_rg              = local.HUB-NET-RG
hub_networking_object           = var.hub_networking_object

# firewall variables 

#az_fw_config                    = var.az_fw_config_object
#fw_ip_addr_config               = var.fw_ip_addr_config

# gateway variables 

provision_gateway               = var.provision_gateway
gateway_config                  = var.gateway_config
remote_network                  = var.remote_network
remote_network_connect          = var.remote_network_connect
connection_name                 = var.connection_name
er_ip_addr_config               = var.er_ip_addr_config

# Diagnostics and logging 

diagnostics_map                 = var.diagnostics_settings
log_analytics_workspace         = var.log_analytics_workspace 
diagnostics_settings            = var.diagnostics_settings  

# Tags variables    
tags                         = var.tags










}  


