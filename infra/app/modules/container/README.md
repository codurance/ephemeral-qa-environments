# Terraform Argument Reference

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_container_group.acg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_registry"></a> [container\_registry](#input\_container\_registry) | Container registry information. | <pre>object({<br>    server   = string<br>    username = string<br>    password = string<br>  })</pre> | n/a | yes |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | The number of CPU cores of the container. | `string` | `"0.5"` | no |
| <a name="input_dns_record_name"></a> [dns\_record\_name](#input\_dns\_record\_name) | DNS record name. | `string` | n/a | yes |
| <a name="input_dns_service_principal"></a> [dns\_service\_principal](#input\_dns\_service\_principal) | Service Principal Credentials for the DNS sidecar | <pre>object({<br>    client_id     = string<br>    client_secret = string<br>    tenant_id     = string<br>  })</pre> | n/a | yes |
| <a name="input_dns_sidecar_cpu"></a> [dns\_sidecar\_cpu](#input\_dns\_sidecar\_cpu) | The number of CPU cores of the dns sidecar container. | `string` | `"0.5"` | no |
| <a name="input_dns_sidecar_docker_image_name"></a> [dns\_sidecar\_docker\_image\_name](#input\_dns\_sidecar\_docker\_image\_name) | The service container docker image name (without the container registry name). | `string` | `"dns_sidecar"` | no |
| <a name="input_dns_sidecar_docker_image_tag"></a> [dns\_sidecar\_docker\_image\_tag](#input\_dns\_sidecar\_docker\_image\_tag) | The service container docker image tag. | `string` | `"latest"` | no |
| <a name="input_dns_sidecar_memory"></a> [dns\_sidecar\_memory](#input\_dns\_sidecar\_memory) | The memory of the dns sidecar container in GB. | `string` | `"0.5"` | no |
| <a name="input_dns_zone_name"></a> [dns\_zone\_name](#input\_dns\_zone\_name) | Private dns zone name to register the service. | `string` | n/a | yes |
| <a name="input_docker_image_name"></a> [docker\_image\_name](#input\_docker\_image\_name) | The service container docker image name (without the container registry name). | `string` | n/a | yes |
| <a name="input_docker_image_tag"></a> [docker\_image\_tag](#input\_docker\_image\_tag) | The service container docker image tag. | `string` | `"latest"` | no |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | Environment variables. | `map(string)` | `{}` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | The memory of the container in GB. | `string` | `"1.5"` | no |
| <a name="input_name"></a> [name](#input\_name) | Service name. | `string` | n/a | yes |
| <a name="input_ports"></a> [ports](#input\_ports) | Service port information. | <pre>list(object({<br>    number   = number<br>    protocol = string<br>  }))</pre> | `[]` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The naming prefix for the resource. | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Resource group information. | <pre>object({<br>    name     = string<br>    location = string<br>  })</pre> | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet to deploy the service. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to associate with your resources. | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

# Helper Commands

## Regenerate the Terraform Argument Reference

Use the [terraform-docs](https://terraform-docs.io/how-to/insert-output-to-file/) command to regenerate the Terraform Argument Reference if you add new variables or edit the existing ones:

```bash
terraform-docs markdown table --output-file README.md .
```
