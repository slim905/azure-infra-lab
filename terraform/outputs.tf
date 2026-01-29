output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.main.name
}

output "vnet_name" {
  description = "Virtual network name"
  value       = module.network.vnet_name
}

output "subnet_ids" {
  description = "Subnet IDs by function"
  value       = module.network.subnet_ids
}

output "db_subnet_id" {
  value = module.network.subnet_ids["db"]
}
