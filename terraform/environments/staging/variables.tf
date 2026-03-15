variable "resource_group_name" { type = string }
variable "location" { type = string }

variable "vnet_name" { type = string }
variable "vnet_address_space" { type = list(string) }
variable "app_subnet_cidr" { type = string }
variable "db_subnet_cidr" { type = string }
variable "nsg_name" { type = string }

variable "nic_name" { type = string }
variable "vm_name" { type = string }
variable "vm_size" { type = string }
variable "admin_username" { type = string }
variable "ssh_public_key_path" { type = string }