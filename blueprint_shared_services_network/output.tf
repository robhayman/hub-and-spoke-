output "Shared_services_network_vnet_object" {
  value = module.shared_services_virtual_network.vnet
}

output "Shared_services_resource_Groups" {
  value = module.resource_groups
}
