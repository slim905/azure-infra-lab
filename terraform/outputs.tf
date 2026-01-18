output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.rg-1.name
}

output "vnet_name" {
  description = "Virtual network name"
  value       = azurerm_virtual_network.main_vnet.name
}

output "subnet_ids" {
  description = "Subnet IDs by function"
  value = {
    app = azurerm_subnet.app_subnet.id
    db  = azurerm_subnet.db_subnet.id
  }
}

output "storage_account_name" {
  description = "Storage account name"
  value       = azurerm_storage_account.stg-2.name
}

output "db_subnet_id" {
  value = azurerm_subnet.db_subnet.id
}
