##########################
# Variables Resource Group
##########################

variable "resource_groups" {
  description = "(Required) Map of the resource groups to create"
}


#######################
# Variables Hub Network
######################

# rg variables

variable "virtual_network_rg" {
  description = "(Required) Name of the resource group where to create the vnet" 
}

# location

variable "location" {
  description = "(Required) Define the region where the resource groups will be created"
}


# vnet variables 

variable "hub_networking_object" {
  description = "(Required) configuration object describing the networking configuration, as described in README"
}


# public IP variable firewall


variable "fw_ip_addr_config" {
  description = "IP address configuration object"
}

# Azure Firewall Variables


variable "az_fw_config" {
  description = "(Required) configuration object for Azure Firewall to be created"
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

#  ER Gateway Variables

variable "er_ip_addr_config" {
  description = "(Required) IP address configuration object"
}

variable "gateway_config" {
  description = "(Required) configuration object of network gateway to be created"
}

variable "remote_network" {
  description = "Map of the remote network configuration"
}

variable "remote_network_connect" {
  description = "Determines if the Remote Network is to be connected after creation."
  type = bool
}

variable "connection_name" {
  description = "Name of the connection to the remote site."
}

variable "provision_gateway" {
  
}

