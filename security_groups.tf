resource "azurerm_network_security_group" "cloudskiff_securitygroup" {
  name                = "CloudSkiffSecurityGroup"
  location            = var.azure_region
  resource_group_name = azurerm_resource_group.cloudskiff_demo_resource_group.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "CloudSkiff Demo"
  }
}