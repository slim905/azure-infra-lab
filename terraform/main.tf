terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.8.0"
}

provider "azurerm" {
  features {}

}

# Main resource group for labs
resource "azurerm_resource_group" "rg-1" {
  name     = var.first_rg
  location = "West US"
}

# Second resource group for Week 2 networking / storage labs
resource "azurerm_resource_group" "rg-2" {
  name     = var.second_rg
  location = var.location
}

# Virtual Network
resource "azurerm_virtual_network" "main_vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.rg-1.location
  resource_group_name = azurerm_resource_group.rg-1.name
}

# Subnets (loop through map)
resource "azurerm_subnet" "subnets" {
  for_each             = var.subnets
  name                 = each.key
  resource_group_name  = azurerm_resource_group.rg-1.name
  virtual_network_name = azurerm_virtual_network.main_vnet.name
  address_prefixes     = [each.value.address_prefix]
}


# Add Storage Account in Secondary Resource Group
resource "azurerm_storage_account" "stg-2" {
  name                     = "stg${random_integer.rand.result}"
  resource_group_name      = azurerm_resource_group.rg-2.name
  location                 = azurerm_resource_group.rg-2.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "random_integer" "rand" {
  min = 10000
  max = 99999
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = azurerm_resource_group.rg-1.location
  resource_group_name = azurerm_resource_group.rg-1.name
}

# Example inbound rule (allow SSH)
resource "azurerm_network_security_rule" "allow_ssh" {
  name                        = "allow-ssh"
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg-1.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_subnet_network_security_group_association" "app_assoc" {
  subnet_id                 = azurerm_subnet.subnets["app"].id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

