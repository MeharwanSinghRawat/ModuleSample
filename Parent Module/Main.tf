module "resource_group_module" {
  source = "../Child_Module/Resource_group_Module"
  rg_name = "newrg"
  rg_location = "central india"

}

module "resource_group_module1" {
  source = "../Child_Module/Resource_group_Module"
  rg_name = "newr22"
  rg_location = "central india"

}

module "Vnet_Module" {
  depends_on = [ module.resource_group_module ]
  source = "../Child_Module/Vnet_module"
  vnet_name = "saurabhVnet"
  vnet_location = "central india"
  rg_name = "newrg"
  address_space = ["10.0.0.0/16"]
  
}

module "subnet_module" {
  depends_on = [ module.Vnet_Module, module.resource_group_module]
  source = "../Child_Module/Subnet_module"
  subnet_name = "saurabh_subnet"
  vnet_name = "saurabhVnet"
  rg_name = "newrg"
  address_prefixes = ["10.0.0.0/24"]

}

module "subnet_module1" {
  depends_on = [ module.Vnet_Module, module.resource_group_module]
  source = "../Child_Module/Subnet_module"
  subnet_name = "saurabh_subnet1"
  vnet_name = "saurabhVnet"
  rg_name = "newrg"
  address_prefixes = ["10.0.1.0/24"]

}