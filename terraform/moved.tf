moved {
  from = azurerm_virtual_network.main_vnet
  to   = module.network.azurerm_virtual_network.main_vnet
}

moved {
  from = azurerm_subnet.app_subnet
  to   = module.network.azurerm_subnet.app_subnet
}

moved {
  from = azurerm_subnet.db_subnet
  to   = module.network.azurerm_subnet.db_subnet
}

moved {
  from = azurerm_network_security_group.nsg
  to   = module.network.azurerm_network_security_group.nsg
}

moved {
  from = azurerm_network_security_rule.allow_ssh
  to   = module.network.azurerm_network_security_rule.allow_ssh
}

moved {
  from = azurerm_subnet_network_security_group_association.app_assoc
  to   = module.network.azurerm_subnet_network_security_group_association.app_assoc
}

moved {
  from = azurerm_subnet_network_security_group_association.db_assoc
  to   = module.network.azurerm_subnet_network_security_group_association.db_assoc
}

moved {
  from = azurerm_network_interface.linux_nic
  to   = module.compute.azurerm_network_interface.linux_nic
}

moved {
  from = azurerm_linux_virtual_machine.linux_vm
  to   = module.compute.azurerm_linux_virtual_machine.linux_vm
}
