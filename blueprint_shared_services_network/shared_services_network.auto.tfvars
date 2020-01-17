########################
# Variables resource groups
########################

## Resource groups
shared_services_resource_groups = {
    shared_services_network          = { 
                    name     = "rguksdevssinfra"
                    location = "uksouth" 
    }
    }
   


#######################
# Variables Hub Network
#######################

# rg variables

virtual_network_rg = "rguksdevinfra"

# location

location    = "uksouth"

# networking variables

shared_services_network = {
        vnet = {
            name                = "sg1-vnet-dmz"
            address_space       = ["10.101.4.0/16"]    
            dns                 = ["192.168.0.16", "192.168.0.64"]
            enable_ddos_std     = true
            ddos_id             = "/subscriptions/fa357408-7eec-4476-84e9-ace688dc1f6c/resourceGroups/testrg/providers/Microsoft.Network/ddosProtectionPlans/myddos"

        }
         specialsubnets     = {
                GatewaySubnet           = {
                name                = "GatewaySubnet" 
                cidr                = "10.101.253.0.0/24"
                service_endpoints   = []
            }
            }
        subnets = {
            Subnet_1        = {
                name                = "Active_Directory"
                cidr                = "10.101.4.128/27"
                service_endpoints   = []
                nsg_inbound         = [
                    # {"Name", "Priority", "Direction", "Action", "Protocol", "source_port_range", "destination_port_range", "source_address_prefix", "destination_address_prefix" }, 
                    ["LDAP-t", "100", "Inbound", "Allow", "*", "*", "389", "*", "*"],
                    ["RPC-EPM", "102", "Inbound", "Allow", "tcp", "*", "135", "*", "*"],
                    ["SMB-In", "103", "Inbound", "Allow", "tcp", "*", "445", "*", "*"],
                ]
                nsg_outbound        = []
                delegation          = {
                    name = "acctestdelegation1" 
                    service_delegation = {
                    name    = "Microsoft.ContainerInstance/containerGroups"
                    actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
                    }
                }
            }
            Subnet_2             = {
                name                = "SQL_Servers"
                cidr                = "10.101.4.160/27"
                service_endpoints   = []
                nsg_inbound         = [
                    ["SQL", "100", "Inbound", "Allow", "tcp", "*", "1433", "*", "*"],
                ]
                nsg_outbound        = []
            }
            Subnet_3       = {
                name                = "Network_Monitoring"
                cidr                = "10.101.4.192/27"
                service_endpoints   = ["Microsoft.EventHub"]
                nsg_inbound         = [
                    # ["Test", "101", "Inbound", "Allow", "tcp", "*", "1643", "*", "*"],
                ]
                nsg_outbound        = []
            }
        }
}


# diagnostics variables

diagnostics_map = {
      diags_sa      = "/subscriptions/fa357408-7eec-4476-84e9-ace688dc1f6c/resourceGroups/operations-rg/providers/Microsoft.Storage/storageAccounts/opslogs"
      eh_id         = "/subscriptions/fa357408-7eec-4476-84e9-ace688dc1f6c/resourceGroups/operations-rg/providers/Microsoft.EventHub/namespaces/sharkeys"
      eh_name       = "sharkeys"
  }

diagnostics_settings = {
    log = [
                # ["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period] 
                ["VMProtectionAlerts", true, true, 60],
        ]
    metric = [
                #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]                 
                  ["AllMetrics", true, true, 60],
    ]
}

#log analytics variables

log_analytics_workspace = {
        id = "/subscriptions/fa357408-7eec-4476-84e9-ace688dc1f6c/resourcegroups/operations-rg/providers/microsoft.operationalinsights/workspaces/sharkeyterraform"
        name = "sharkeyterraform"
  }

#Tags 
tags    = {
                     project     = "Core Networking "
                     environment     = "Development"
}
