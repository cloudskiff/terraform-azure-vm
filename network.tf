resource "azurerm_virtual_network" "cloudskiff_network" {
  name                = "CloudSkiffVNetwork"
  address_space       = var.network_address_space
  location            = var.azure_region
  resource_group_name = azurerm_resource_group.cloudskiff_demo_resource_group.name

  tags = {
    environment = "CloudSkiff Demo"
  }
}

resource "azurerm_subnet" "cloudskiff_subnet" {
  name                 = "CloudSkiffSubnet"
  resource_group_name  = azurerm_resource_group.cloudskiff_demo_resource_group.name
  virtual_network_name = azurerm_virtual_network.cloudskiff_network.name
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_public_ip" "cloudskiff_public_ip" {
  name                = "CloudSkiffPublicIP"
  location            = var.azure_region
  resource_group_name = azurerm_resource_group.cloudskiff_demo_resource_group.name
  allocation_method   = "Dynamic"

  tags = {
    environment = "CloudSkiff Demo"
  }
}

resource "azurerm_network_interface" "cloudskiff_nic" {
  name                = "CloudSkiffNIC"
  location            = var.azure_region
  resource_group_name = azurerm_resource_group.cloudskiff_demo_resource_group.name
  # network_security_group_id   = azurerm_network_security_group.cloudskiff_securitygroup.id

  ip_configuration {
    name                          = "CloudSkiffNICipConfig"
    subnet_id                     = azurerm_subnet.cloudskiff_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.cloudskiff_public_ip.id
  }

  tags = {
    environment = "CloudSkiff Demo"
  }
}