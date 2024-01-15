resource "azurerm_network_interface_security_group_association" "associationnsg" {
    for_each = var.association_nag
  network_interface_id      = each.value.network_interface_id
  network_security_group_id = each.value.network_security_group_id
}