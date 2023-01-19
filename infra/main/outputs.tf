output "resource_group_name" {
  description = "The Resource Group name."
  value       = azurerm_resource_group.rg.name
}

output "resource_group_location" {
  description = "The Resource Group location."
  value       = azurerm_resource_group.rg.location
}

output "container_registry_login_server" {
  description = "The Container Registry login server endpoint."
  value       = azurerm_container_registry.cr.login_server
}

output "container_registry_admin_username" {
  description = "The Container Registry admin username."
  value       = azurerm_container_registry.cr.admin_username
  sensitive   = true
}

output "container_registry_admin_password" {
  description = "The Container Registry admin password."
  value       = azurerm_container_registry.cr.admin_password
  sensitive   = true
}

output "aci_subnet_id" {
  description = "The aci subnet ID."
  value       = azurerm_subnet.aci_sub.id
}

output "dns_zone_name" {
  description = "DNS zone name to use."
  value       = azurerm_private_dns_zone.pdz.name
}

output "vm_public_ip" {
  description = "The public IP of the VM."
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
}
