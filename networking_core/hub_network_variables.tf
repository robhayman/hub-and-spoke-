# Resource Group variables

variable "resource_groups" {
  description = "(Required) Name of the resource group where to create the vnet" 
}

variable "location" {
  description = "(Required) Name of the resource group where to create the vnet" 
}

# network variables

variable "virtual_network_rg" {
  description = "(Required) Name of the resource group where to create the vnet" 
}

variable "hub_networking_object" {
  description = "(Required) Name of the resource group where to create the vnet" 
}

# # Firewall variables

# variable "az_fw_config" {
#   description = "(Required) Name of the resource group where to create the vnet" 
# }

# variable "fw_ip_addr_config" {
#   description = "(Required) Name of the resource group where to create the vnet" 
# }

# Gateway variables

variable "provision_gateway" {
  description = "(Required) Name of the resource group where to create the vnet" 
}

variable "gateway_config" {
  description = "(Required) Name of the resource group where to create the vnet" 
}
variable "remote_network" {
  description = "(Required) Name of the resource group where to create the vnet" 
}
variable "remote_network_connect" {
  description = "(Required) Name of the resource group where to create the vnet" 
}
variable "connection_name" {
  description = "(Required) Name of the resource group where to create the vnet" 
}
variable "er_ip_addr_config" {
  description = "(Required) Name of the resource group where to create the vnet" 
}

# Diagnostics and Logging

variable "diagnostics_map" {
  description = "(Required) Name of the resource group where to create the vnet" 
}

variable "log_analytics_workspace" {
  description = "(Required) Name of the resource group where to create the vnet" 
}

variable "diagnostics_settings" {
  description = "(Required) Name of the resource group where to create the vnet" 
}

# tags

variable "tags" {
  description = "(Required) Name of the resource group where to create the vnet" 
}