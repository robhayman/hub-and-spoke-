########################
# Variables resource groups
########################

## Resource groups
resource_groups = {
    hub_network          = { 
                    name     = "rguksdevinfra"
                    location = "uksouth"
    },
    palo_alto            = {    
                    name     = "rguksdevpalo"
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

hub_networking_object = {
        vnet = {
            name                = "sg1-vnet-dmz"
            address_space       = ["10.0.0.0/8"]     # 10.100.4.0 - 10.100.7.255
            dns                 = ["192.168.0.16", "192.168.0.64"]
            enable_ddos_std     = true
            ddos_id             = "/subscriptions/fa357408-7eec-4476-84e9-ace688dc1f6c/resourceGroups/testrg/providers/Microsoft.Network/ddosProtectionPlans/myddos"

        }
        specialsubnets     = {
                AzureFirewallSubnet = {
                name                = "AzureFirewallSubnet"
                cidr                = "10.0.254.0/24"
               }
                GatewaySubnet           = {
                name                = "GatewaySubnet" 
                cidr                = "10.0.253.0.0/24"
                service_endpoints   = []
            }
            }
        subnets = {
            Subnet_1        = {
                name                = "Active_Directory"
                cidr                = "10.0.1.0/24"
                service_endpoints   = []
                nsg_inbound         = [
                    # {"Name", "Priority", "Direction", "Action", "Protocol", "source_port_range", "destination_port_range", "source_address_prefix", "destination_address_prefix" }, 
                    ["LDAP-t", "100", "Inbound", "Allow", "*", "*", "389", "*", "*"],
                    ["RPC-EPM", "102", "Inbound", "Allow", "tcp", "*", "135", "*", "*"],
                    ["SMB-In", "103", "Inbound", "Allow", "tcp", "*", "445", "*", "*"],
                ]
                nsg_outbound        = []
            }
            Subnet_2             = {
                name                = "palo1"
                cidr                = "10.0.2.0/24"
                service_endpoints   = []
                nsg_inbound         = [
                    ["SQL", "100", "Inbound", "Allow", "tcp", "*", "1433", "*", "*"],
                ]
                nsg_outbound        = []
            }
            Subnet_3       = {
                name                = "palo2"
                cidr                = "10.0.3.0/27"
                service_endpoints   = []
                nsg_inbound         = [
                    # ["Test", "101", "Inbound", "Allow", "tcp", "*", "1643", "*", "*"],
                ]
                nsg_outbound        = []
            }
            Subnet_4       = {
                name                = "palo3"
                cidr                = "10.0.4.0/24"
                service_endpoints   = []
                nsg_inbound         = [
                    # ["Test", "101", "Inbound", "Allow", "tcp", "*", "1643", "*", "*"],
                ]
                nsg_outbound        = []
            }
        }
}

#########################
# Firewall variables 
#########################

# firewall variables
az_fw_config = {
    name = "fw_hub_dev"
    diagnostics = {
        log = [
                    #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period] 
                    ["AzureFirewallApplicationRule", true, true, 30],
                    ["AzureFirewallNetworkRule", true, true, 30],
        ]
        metric = [
                ["AllMetrics", true, true, 30],
        ]
    } 
}

# FW Public IP Variables
fw_ip_addr_config = {
    ip_name = "pip_hub_network_fw"    
    allocation_method   = "Static" 
    sku                 = "Standard"                        
    ip_version          = "IPv4"                            
    diagnostics = {
        log = [
                    #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period] 
                    ["DDoSProtectionNotifications", true, true, 30],
                    ["DDoSMitigationFlowLogs", true, true, 30],
                    ["DDoSMitigationReports", true, true, 30],
            ]
        metric = [
                ["AllMetrics", true, true, 30],
        ]
    }
}

######################
# GATEWAY VARIABLES
######################

# Gateway Variables

provision_gateway = false
gateway_config  = {
    gateway_type                 = "ExpressRoute" 
    er_gateway_name             = "er_gw_uks_hub_dev"
    active_active                = false
    enable_bgp                   = true 
    er_gateway_sku              = "ErGw1az"
    diagnostics = {
        log = [
                    #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period] 
                    ["GatewayDiagnosticLog", true, true, 30],
                    ["TunnelDiagnosticLog", true, true, 30],
                    ["RouteDiagnosticLog", true, true, 30],
                    ["IKEDiagnosticLog", true, true, 30],
                    ["P2SDiagnosticLog", true, true, 30],
            ]
        metric = [
                ["AllMetrics", true, true, 30],
        ]
    }
}

# Gateway IP 

er_ip_addr_config = {
    name   = "pip_er_gw_uks_hub_dev"
    allocation_method = "Dynamic"
    sku               = "standard"
    diagnostics = {
        log = [
                    #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period] 
                    ["DDoSProtectionNotifications", true, true, 30],
                    ["DDoSMitigationFlowLogs", true, true, 30],
                    ["DDoSMitigationReports", true, true, 30],
            ]
        metric = [
                ["AllMetrics", true, true, 30],
        ]
    }
}

# Connection

connection_name = "con_er_uks_dev_onprem"
remote_network_connect = true

remote_network = {
    gateway_name = "onprem_gw"
    gateway_ip = "1.2.3.4"
    gateway_adress_space = ["1.0.0.0/8"]
}


###################################
#Diagnostics and logging Variables
###################################

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

################
# Tag variables
################


#Tags 
tags    = {
                     project     = "Core Networking "
                     environment     = "Development"
                    }

