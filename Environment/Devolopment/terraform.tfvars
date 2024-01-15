module_rgs = {
    "rg1" = {
        name = "ojrg1"
        location = "east us"
    }
}
vnets = {
vnet1 = {
    name                = "ojvnet"
  location            = "east us"
  resource_group_name = "ojrg1"
  address_space       = ["10.0.0.0/16"]

}
}
sbnets = {
    snet1 = {
     name                 = "frontend_subnet"
     resource_group_name  = "ojrg1"
     virtual_network_name = "ojvnet"
     address_prefixes     = ["10.0.1.0/24"]
    }
}
publicip = {
    "pip1" ={
        name = "ojpip1"
        resource_group_name = "ojrg1"
        location = "east us"
allocation_method   = "Static"
}
}
networkinterface = {
    "nic1" ={
        name = "frontendvm-nic"
        location = "east us"
        resource_group_name = "ojrg1"
        subnet_id = "/subscriptions/aeed7b89-3927-4230-8ce0-d72a936fe3f7/resourceGroups/ojrg1/providers/Microsoft.Network/virtualNetworks/ojvnet/subnets/frontend_subnet"
        public_ip_address_id = "/subscriptions/aeed7b89-3927-4230-8ce0-d72a936fe3f7/resourceGroups/ojrg1/providers/Microsoft.Network/publicIPAddresses/ojpip1"
            
    }
}
virtualMachine = {
    "vm1" = {
       name                  = "frontendvm"
  location              = "east us"
  resource_group_name   = "ojrg1"
  network_interface_ids = ["/subscriptions/aeed7b89-3927-4230-8ce0-d72a936fe3f7/resourceGroups/ojrg1/providers/Microsoft.Network/networkInterfaces/frontendvm-nic"]
  admin_username = "poojaojha"
  admin_password = "Ojh@123456"
  vm_size               = "Standard_DS1_v2"
  storage_image_reference = {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest" 
    }
    diskname = "my-disk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
}
}