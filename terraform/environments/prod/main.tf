resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source              = "../../modules/network"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  vnet_name          = var.vnet_name
  vnet_address_space = var.vnet_address_space

  app_subnet_cidr = var.app_subnet_cidr
  db_subnet_cidr  = var.db_subnet_cidr

  nsg_name = var.nsg_name
}

module "compute" {
  source              = "../../modules/compute"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  subnet_id = module.network.subnet_ids["db"]

  nic_name = var.nic_name
  vm_name  = var.vm_name
  vm_size  = var.vm_size

  admin_username      = var.admin_username
  ssh_public_key_path = var.ssh_public_key_path
}