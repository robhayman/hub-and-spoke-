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
