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
  aks_subnet_cidr = var.aks_subnet_cidr

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

module "aks" {
  source              = "../../modules/aks"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  cluster_name       = var.aks_cluster_name
  dns_prefix         = var.aks_dns_prefix
  kubernetes_version = var.aks_kubernetes_version
  node_count         = var.aks_node_count
  vm_size            = var.aks_vm_size

  aks_subnet_id = module.network.subnet_ids["aks"]

  pod_cidr       = var.aks_pod_cidr
  service_cidr   = var.aks_service_cidr
  dns_service_ip = var.aks_dns_service_ip
}