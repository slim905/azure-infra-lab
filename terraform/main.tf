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
