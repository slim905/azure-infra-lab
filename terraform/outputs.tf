output "main_rg_name" {
  description = "Name of the main resource group"
  value       = azurerm_resource_group.rg-1.name
}

output "secondary_rg_name" {
  description = "Name of the secondary resource group"
  value       = azurerm_resource_group.rg-2.name
}

output "vnet_name" {
  value = azurerm_virtual_network.main.name
}

output "vm_private_ip" {
  value = azurerm_network_interface.main.private_ip_address
}

output "storage_account_name" {
  value = azurerm_storage_account.main.name
}

output "subnet_ids" {
  value = { for k, v in azurerm_subnet.subnets : k => v.id }
}