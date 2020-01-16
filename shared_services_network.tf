module "blueprint_shared_services_network" {
    source = "./blueprint_shared_services_network"


# Resource groups variables

resource_groups                 = var.resource_groups
location                        = var.location

# Network variables 

virtual_network_rg              = local.HUB-NET-RG
hub_networking_object           = var.hub_networking_object

# Diagnostics and logging 

diagnostics_map                 = var.diagnostics_settings
log_analytics_workspace         = var.log_analytics_workspace 
diagnostics_settings            = var.diagnostics_settings  

# Tags variables    
tags   