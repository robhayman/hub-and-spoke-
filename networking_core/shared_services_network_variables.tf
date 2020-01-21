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