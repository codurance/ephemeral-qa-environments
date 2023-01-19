resource "azurerm_subnet" "vm_sub" {
  name                 = "${local.prefix}-vm-sub"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.vm_sub_address_prefixes
}

resource "azurerm_network_security_group" "sg" {
  name                = "${local.prefix}-sg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Jenkins HTTP"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "nsga" {
  subnet_id                 = azurerm_subnet.vm_sub.id
  network_security_group_id = azurerm_network_security_group.sg.id
}

resource "azurerm_public_ip" "pip" {
  name                = "${local.prefix}-pip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Dynamic"

  tags = var.tags
}

resource "azurerm_network_interface" "vm_nic" {
  name                = "${local.prefix}-vm-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "${local.prefix}-external"
    subnet_id                     = azurerm_subnet.vm_sub.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }

  tags = var.tags
}

data "template_file" "init" {
  template = file("templates/bootstrap.tftpl")
  vars = {
    vm_admin_username = var.vm_admin_username
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "${local.prefix}-vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = var.vm_size
  admin_username      = var.vm_admin_username
  custom_data         = base64encode(data.template_file.init.rendered)

  network_interface_ids = [
    azurerm_network_interface.vm_nic.id
  ]

  admin_ssh_key {
    username   = var.vm_admin_username
    public_key = file("ssh-key/key.pub")
  }

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
