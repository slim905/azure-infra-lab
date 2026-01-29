module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  vnet_name          = var.vnet_name
  vnet_address_space = var.vnet_address_space

  app_subnet_cidr = var.app_subnet_cidr
  db_subnet_cidr  = var.db_subnet_cidr

  nsg_name = var.nsg_name
}
