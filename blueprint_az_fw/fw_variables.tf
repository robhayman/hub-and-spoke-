# public IP variable firewall

variable "fw_ip_addr_config" {
  description = "IP address configuration object"
}

# Azure Firewall Variables


variable "az_fw_config" {
  description = "(Required) configuration object for Azure Firewall to be created"
}
