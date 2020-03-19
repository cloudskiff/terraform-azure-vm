# Generate a new ID only when a new resource group is defined
resource "random_id" "randomId" {
  keepers = {
    resource_group = azurerm_resource_group.cloudskiff_demo_resource_group.name
  }

  byte_length = 8
}