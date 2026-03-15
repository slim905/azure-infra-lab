resource_group_name = "rg-terraform-prod"
location            = "eastus"

vnet_name          = "prod-vnet"
vnet_address_space = ["10.20.0.0/16"]
app_subnet_cidr    = "10.20.1.0/24"
db_subnet_cidr     = "10.20.2.0/24"
nsg_name           = "prod-nsg"

nic_name            = "nic-linux-prod-01"
vm_name             = "vm-linux-prod-01"
vm_size             = "Standard_B2s"
admin_username      = "azureuser"
ssh_public_key_path = "~/.ssh/id_rsa.pub"