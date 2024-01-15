resource "azurerm_virtual_machine" "vm" {
    for_each = var.vm
  name                  = each.value.name
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  network_interface_ids = each.value.network_interface_ids
  vm_size               = "Standard_DS1_v2"
  storage_image_reference {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    
    name              = each.value.diskname
    caching           = each.value.caching
    create_option     = each.value.create_option
    managed_disk_type = each.value.managed_disk_type
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "poojaojha"
    admin_password = "Ojh@123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
}
}