module "resource_group" {
  source = "../../modulescode/resourcegroup"
  rg = var.module_rgs
}

module "Vnet" {
  source = "../../modulescode/virtualnetwork"
  vnet = var.vnets
  depends_on = [ module.resource_group ]
}
module "sbnet" {
  source = "../../modulescode/subnet"
  subnet = var.sbnets
  depends_on = [ module.Vnet ]
}
module "pip" {
  source = "../../modulescode/publicIP"
  pip = var.publicip
}
module "nic" {
  source = "../../modulescode/networkinterface"
  nic = var.networkinterface
  depends_on = [ module.pip ]
}
module "vm" {
  source = "../../modulescode/virtualMachine"
  vm = var.virtualMachine
  depends_on = [ module.nic ]
}