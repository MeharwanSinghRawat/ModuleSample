resource "azurerm_virtual_network" "vnet" {
  name = var.vnet_name
    resource_group_name = var.rg_name
    location = var.vnet_location
  address_space = var.address_space
  
}
