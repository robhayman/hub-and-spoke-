# Reference on https://www.terraform.io/docs/providers/azurerm/r/virtual_network_gateway.html

# Vnext idea: Client connection features
# 1. Client connection subnet
# 2. Client connection algo (ipsec, l2tip, openvpn)
# 3. Client certificate authority generated/stored in AKV


resource "azurerm_virtual_network_gateway" "er_gateway" {

  name                = var.gateway_config.er_gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name
  type                = "ExpressRoute"
  active_active       = var.gateway_config.active_active
  enable_bgp          = var.gateway_config.enable_bgp
  sku                 = var.gateway_config.er_gateway_sku
  tags                = var.tags

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = var.er_ip_addr_config
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.gateway_subnet
  }

  # vpn_client_configuration {
  #   address_space = ["10.2.0.0/24"]
  #   # root_certificate {
  #     # name = "Name_Of_CA"

  #     # public_cert_data = <<EOF
  #     # EOF
  #    }

}

