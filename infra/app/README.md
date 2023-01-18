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
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_employees"></a> [employees](#module\_employees) | ./modules/container | n/a |
| <a name="module_payroll"></a> [payroll](#module\_payroll) | ./modules/container | n/a |

## Resources

| Name | Type |
|------|------|
| [terraform_remote_state.main](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | The Azure Service Principal client id. | `string` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | The Azure Service Principal client secret. | `string` | n/a | yes |
| <a name="input_employees_docker_image_name"></a> [employees\_docker\_image\_name](#input\_employees\_docker\_image\_name) | The employees container name. | `string` | `"employees"` | no |
| <a name="input_employees_docker_image_port"></a> [employees\_docker\_image\_port](#input\_employees\_docker\_image\_port) | The employees container port. | `number` | `4567` | no |
| <a name="input_employees_docker_image_tag"></a> [employees\_docker\_image\_tag](#input\_employees\_docker\_image\_tag) | The employees container tag. | `string` | `"latest"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name. | `string` | n/a | yes |
| <a name="input_environment_id"></a> [environment\_id](#input\_environment\_id) | Ephemeral environment id. | `string` | n/a | yes |
| <a name="input_main_remote_state_container_name"></a> [main\_remote\_state\_container\_name](#input\_main\_remote\_state\_container\_name) | The container name where the remote state lives. | `string` | n/a | yes |
| <a name="input_main_remote_state_resource_group_name"></a> [main\_remote\_state\_resource\_group\_name](#input\_main\_remote\_state\_resource\_group\_name) | The resource group name where the remote state storage account lives. | `string` | n/a | yes |
| <a name="input_main_remote_state_storage_account_name"></a> [main\_remote\_state\_storage\_account\_name](#input\_main\_remote\_state\_storage\_account\_name) | The storage account name of the remote state. | `string` | n/a | yes |
| <a name="input_payroll_docker_image_name"></a> [payroll\_docker\_image\_name](#input\_payroll\_docker\_image\_name) | The payroll container name. | `string` | `"payroll"` | no |
| <a name="input_payroll_docker_image_port"></a> [payroll\_docker\_image\_port](#input\_payroll\_docker\_image\_port) | The payroll container port. | `number` | `4567` | no |
| <a name="input_payroll_docker_image_tag"></a> [payroll\_docker\_image\_tag](#input\_payroll\_docker\_image\_tag) | The payroll container tag. | `string` | `"latest"` | no |
| <a name="input_project"></a> [project](#input\_project) | The project name. | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The Azure account subscription id. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to associate with your resources. | `map(string)` | <pre>{<br>  "created_by": "terraform",<br>  "environment": "dev"<br>}</pre> | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | The Azure Service Principal tenant id. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

# Helper Commands

## Regenerate the Terraform Argument Reference

Use the [terraform-docs](https://terraform-docs.io/how-to/insert-output-to-file/) command to regenerate the Terraform Argument Reference if you add new variables or edit the existing ones:

```bash
terraform-docs markdown table --output-file README.md .
```
