resource_group_name = "rg-terraform-staging"
location            = "eastus"

vnet_name          = "staging-vnet"
vnet_address_space = ["10.10.0.0/16"]
app_subnet_cidr    = "10.10.1.0/24"
db_subnet_cidr     = "10.10.2.0/24"
nsg_name           = "staging-nsg"

nic_name            = "nic-linux-staging-01"
vm_name             = "vm-linux-staging-01"
vm_size             = "Standard_B2s"
admin_username      = "azureuser"
ssh_public_key_path = "~/.ssh/id_rsa.pub"