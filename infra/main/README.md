# Terraform Argument Reference

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.6 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.35.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.35.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_bastion_host.bastion](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bastion_host) | resource |
| [azurerm_container_registry.cr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |
| [azurerm_linux_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.vm_nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_private_dns_zone.pdz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.dnszonelink](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_public_ip.bastion_pip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.aci_sub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.bastion_sub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.vm_sub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aci_sub_address_prefixes"></a> [aci\_sub\_address\_prefixes](#input\_aci\_sub\_address\_prefixes) | The address prefixes of the aci subnet. | `list(string)` | <pre>[<br>  "10.0.1.0/24"<br>]</pre> | no |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space of the virtual network. | `list(string)` | <pre>[<br>  "10.0.0.0/16"<br>]</pre> | no |
| <a name="input_bastion_sub_address_prefixes"></a> [bastion\_sub\_address\_prefixes](#input\_bastion\_sub\_address\_prefixes) | The address prefixes of the Bastion subnet. | `list(string)` | <pre>[<br>  "10.0.100.0/24"<br>]</pre> | no |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | The Azure Service Principal client id. | `string` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | The Azure Service Principal client secret. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The project name. | `string` | n/a | yes |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The resource group location. | `string` | `"uksouth"` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The Azure account subscription id. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to associate with your resources. | `map(string)` | <pre>{<br>  "created_by": "terraform",<br>  "environment": "dev"<br>}</pre> | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | The Azure Service Principal tenant id. | `string` | n/a | yes |
| <a name="input_vm_admin_password"></a> [vm\_admin\_password](#input\_vm\_admin\_password) | The password of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_vm_admin_username"></a> [vm\_admin\_username](#input\_vm\_admin\_username) | The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created. | `string` | `"adminuser"` | no |
| <a name="input_vm_disk_caching"></a> [vm\_disk\_caching](#input\_vm\_disk\_caching) | The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite. | `string` | `"ReadWrite"` | no |
| <a name="input_vm_disk_storage_type"></a> [vm\_disk\_storage\_type](#input\_vm\_disk\_storage\_type) | The Storage Account Type of the Internal OS Disk. Possible values are Standard\_LRS, StandardSSD\_LRS, Premium\_LRS, StandardSSD\_ZRS and Premium\_ZRS. Changing this forces a new resource to be created. | `string` | `"Standard_LRS"` | no |
| <a name="input_vm_offer"></a> [vm\_offer](#input\_vm\_offer) | Specifies the offer of the image used to create the virtual machine. | `string` | `"0001-com-ubuntu-server-jammy"` | no |
| <a name="input_vm_publisher"></a> [vm\_publisher](#input\_vm\_publisher) | Specifies the publisher of the image used to create the virtual machine. | `string` | `"canonical"` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | The SKU which should be used for the Virtual Machine, such as Standard\_F2. | `string` | `"Standard_D2s_v3"` | no |
| <a name="input_vm_sku"></a> [vm\_sku](#input\_vm\_sku) | Specifies the SKU of the image used to create the virtual machine. | `string` | `"22_04-lts-gen2"` | no |
| <a name="input_vm_sub_address_prefixes"></a> [vm\_sub\_address\_prefixes](#input\_vm\_sub\_address\_prefixes) | The address prefixes of the VM subnet. | `list(string)` | <pre>[<br>  "10.0.150.0/24"<br>]</pre> | no |
| <a name="input_vm_version"></a> [vm\_version](#input\_vm\_version) | Specifies the version of the image used to create the virtual machine. | `string` | `"latest"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aci_subnet_id"></a> [aci\_subnet\_id](#output\_aci\_subnet\_id) | The aci subnet ID. |
| <a name="output_container_registry_admin_password"></a> [container\_registry\_admin\_password](#output\_container\_registry\_admin\_password) | The Container Registry admin password. |
| <a name="output_container_registry_admin_username"></a> [container\_registry\_admin\_username](#output\_container\_registry\_admin\_username) | The Container Registry admin username. |
| <a name="output_container_registry_login_server"></a> [container\_registry\_login\_server](#output\_container\_registry\_login\_server) | The Container Registry login server endpoint. |
| <a name="output_dns_zone_name"></a> [dns\_zone\_name](#output\_dns\_zone\_name) | DNS zone name to use. |
| <a name="output_resource_group_location"></a> [resource\_group\_location](#output\_resource\_group\_location) | The Resource Group location. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The Resource Group name. |
<!-- END_TF_DOCS -->

# Helper Commands

## Regenerate the Terraform Argument Reference

Use the [terraform-docs](https://terraform-docs.io/how-to/insert-output-to-file/) command to regenerate the Terraform Argument Reference if you add new variables or edit the existing ones:

```bash
terraform-docs markdown table --output-file README.md .
```
