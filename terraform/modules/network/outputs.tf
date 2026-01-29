output "subnet_ids" {
  value = {
    app = azurerm_subnet.app_subnet.id
    db  = azurerm_subnet.db_subnet.id
  }
}

output "vnet_name" {
  value = azurerm_virtual_network.main_vnet.name
}
