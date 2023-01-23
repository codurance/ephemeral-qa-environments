resource "azurerm_resource_group" "rg" {
  name     = "${local.prefix}-rg"
  location = var.resource_group_location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${local.prefix}-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.address_space

  tags = var.tags
}

resource "azurerm_subnet" "aci_sub" {
  name                 = "${local.prefix}-aci-sub"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.aci_sub_address_prefixes

  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}

resource "azurerm_private_dns_zone" "pdz" {
  name                = replace("${local.prefix}-pdz.azure.com", "-", ".")
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "dnszonelink" {
  name                  = "${local.prefix}-dns-zone-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.pdz.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}
