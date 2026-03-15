resource_group_name = "rg-terraform-lab-1"
location            = "eastus"

vnet_name          = "demo-vnet"
vnet_address_space = ["10.0.0.0/16"]
app_subnet_cidr    = "10.0.1.0/24"
db_subnet_cidr     = "10.0.2.0/24"
nsg_name           = "demo-nsg"

nic_name            = "nic-linux-01"
vm_name             = "vm-linux-01"
vm_size             = "Standard_B2s"
admin_username      = "azureuser"
ssh_public_key_path = "~/.ssh/id_rsa.pub"