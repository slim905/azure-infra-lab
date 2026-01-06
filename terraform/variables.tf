variable "first_rg" {
  description = "The name of the first resource group"
  type        = string
  default     = "rg-terraform-lab-1"
}
variable "second_rg" {
  description = "The name of the second resource group"
  type        = string
  default     = "rg-terraform-lab-2"
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

variable "subnets" {
  description = "Subnets to create"
  type = map(object({
    address_prefix = string
  }))
  default = {
    app = {
      address_prefix = "10.0.1.0/24"
    }
    db = {
      address_prefix = "10.0.2.0/24"
    }
  }
}

variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
  default     = "demo-nsg"
}
