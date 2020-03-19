resource "azurerm_resource_group" "cloudskiff_demo_resource_group" {
  name     = "CloudSkiffDemoResourceGroup"
  location = var.azure_region

  tags = {
    environment = "CloudSkiff Demo"
  }
}