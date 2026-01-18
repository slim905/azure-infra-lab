resource "azurerm_network_interface" "linux_nic" {
  name                = "nic-linux-01"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.db_subnet.id
    private_ip_address_allocation = "Dynamic"
  }

}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                = "vm-linux-01"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  size                = "Standard_B2s"

  admin_username = "azureuser"

  network_interface_ids = [
    azurerm_network_interface.linux_nic.id
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

}
