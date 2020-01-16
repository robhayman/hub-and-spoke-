module "blueprint_shared_services_network" {
    source = "./blueprint_shared_services_network"


# Resource groups variables

resource_groups                 = var.shared_Services_network_resource_groups
location                        = var.location

# Network variables 

virtual_network_rg              = var.shared_Services_network_resource_groups
networking_object               = var.shared_services_network_object

# Diagnostics and logging 

diagnostics_map                 = var.diagnostics_settings
log_analytics_workspace         = var.log_analytics_workspace 
diagnostics_settings            = var.diagnostics_settings  

# Tags variables    
tags   


#module "blueprint_peering" {
#    source = "./blueprint_peering"


# add in vars


# output from hub
#
#    shared_services_vnet_object         = module.blueprint_hub_network.hub_networking_object
#    virtual_network_rg                  = module.blueprint_hub_network.resource_groups
#}


