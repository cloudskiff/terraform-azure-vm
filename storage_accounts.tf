resource "azurerm_storage_account" "cloudskiff_storage_account" {
  name                     = "diag${random_id.randomId.hex}"
  resource_group_name      = azurerm_resource_group.cloudskiff_demo_resource_group.name
  location                 = var.azure_region
  account_replication_type = "LRS"
  account_tier             = "Standard"

  tags = {
    environment = "CloudSkiff Demo"
  }
}