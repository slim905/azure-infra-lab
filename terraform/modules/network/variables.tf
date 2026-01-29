variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "vnet_name" { type = string }
variable "vnet_address_space" { type = list(string) }
variable "app_subnet_cidr" { type = string }
variable "db_subnet_cidr" { type = string }
variable "nsg_name" { type = string }
