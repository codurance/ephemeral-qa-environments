resource "azurerm_subnet" "bastion_sub" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.bastion_sub_address_prefixes
}

resource "azurerm_public_ip" "bastion_pip" {
  name                = "${local.prefix}-bastion-pip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = var.tags
}

resource "azurerm_bastion_host" "bastion" {
  name                = "${local.prefix}-bastion"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                 = "${local.prefix}-bastion"
    subnet_id            = azurerm_subnet.bastion_sub.id
    public_ip_address_id = azurerm_public_ip.bastion_pip.id
  }

  tags = var.tags
}

resource "azurerm_subnet" "vm_sub" {
  name                 = "${local.prefix}-vm-sub"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.vm_sub_address_prefixes
}

resource "azurerm_network_interface" "vm_nic" {
  name                = "${local.prefix}-vm-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "${local.prefix}-private"
    subnet_id                     = azurerm_subnet.vm_sub.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                            = "${local.prefix}-vm"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  size                            = var.vm_size
  admin_username                  = var.vm_admin_username
  admin_password                  = var.vm_admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.vm_nic.id
  ]

  source_image_reference {
    publisher = var.vm_publisher
    offer     = var.vm_offer
    sku       = var.vm_sku
    version   = var.vm_version
  }

  os_disk {
    storage_account_type = var.vm_disk_storage_type
    caching              = var.vm_disk_caching
  }

  tags = var.tags
}
