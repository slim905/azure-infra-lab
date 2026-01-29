module "compute" {
  source              = "./modules/compute"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  subnet_id = module.network.subnet_ids["db"]

  nic_name = "nic-linux-01"
  vm_name  = "vm-linux-01"
  vm_size  = "Standard_B2s"

  admin_username      = "azureuser"
  ssh_public_key_path = "~/.ssh/id_rsa.pub"
}
