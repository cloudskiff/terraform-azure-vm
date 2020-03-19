resource "azurerm_virtual_machine" "cloudskiff_demo_vm" {
  name                  = "CloudSkiffDemoVM"
  location              = var.azure_region
  resource_group_name   = azurerm_resource_group.cloudskiff_demo_resource_group.name
  network_interface_ids = [azurerm_network_interface.cloudskiff_nic.id]
  vm_size               = var.vm_size

  storage_os_disk {
    name              = "CloudSkiffDemoOsDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04.0-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "cloudskiffdemo"
    admin_username = var.admin_username
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      path     = "/home/azureuser/.ssh/authorized_keys"
      key_data = var.ssh_public_key
    }
  }

  boot_diagnostics {
    enabled     = "true"
    storage_uri = azurerm_storage_account.cloudskiff_storage_account.primary_blob_endpoint
  }

  tags = {
    environment = "CloudSkiff Demo"
  }
}