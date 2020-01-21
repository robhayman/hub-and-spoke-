##########################
# Variables Resource Group
##########################

variable "spoke_resource_groups" {
  description = "(Required) Map of the resource groups to create"
}


#######################
# Variables Shared services Network
######################

# rg variables

variable "virtual_network_rg" {
  description = "(Required) Name of the resource group where to create the vnet"
  type        = string
}

# location

variable "location" {
  description = "(Required) Define the region where the resource groups will be created"
  type        = string
}


# vnet variables 

variable "spoke_network" {
  description = "(Required) configuration object describing the networking configuration, as described in README"
}


# diagnostics variables

variable "diagnostics_map" {
  description = "(Required) contains the SA and EH details for operations diagnostics"
}

variable "diagnostics_settings" {
  description = "(Required) configuration object describing the diagnostics"
}

# log analytics variables

variable "log_analytics_workspace" {
  description = "(Required) contains the log analytics workspace details for operations diagnostics"
}

# tags variables

variable "tags" {
  description = "(Required) map of tags for the deployment"
}

# prefix variable cant get rid of this stupid variable its req for the module which is pretty sodding stupid

variable "prefix" {
  description = "(Optional) You can use a prefix to add to the list of resource groups you want to create"

}



