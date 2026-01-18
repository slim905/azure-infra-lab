# Main resource group for labs
resource "azurerm_resource_group" "main" {
  name     = var.first_rg
  location = var.location
}
