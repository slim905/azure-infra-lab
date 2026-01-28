variable "resource_group_name" {
  description = "Name of the resource group for workload resources"
  type        = string
  default     = "rg-terraform-lab-1"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "East US"
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "demo-vnet"
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "app_subnet_cidr" {
  description = "CIDR for app subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "db_subnet_cidr" {
  description = "CIDR for db subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
  default     = "demo-nsg"
}
