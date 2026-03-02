output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "subnet_ids" {
  value = module.network.subnet_ids
}

output "db_subnet_id" {
  value = module.network.subnet_ids["db"]
}