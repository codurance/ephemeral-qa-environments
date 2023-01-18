locals {
  environment_id = var.environment_id
  prefix         = "${var.environment}-${var.project}-${local.environment_id}"

  resource_group = {
    location = data.terraform_remote_state.main.outputs.resource_group_location
    name     = data.terraform_remote_state.main.outputs.resource_group_name
  }

  main_container_registry = {
    server   = data.terraform_remote_state.main.outputs.container_registry_login_server
    username = data.terraform_remote_state.main.outputs.container_registry_admin_username
    password = data.terraform_remote_state.main.outputs.container_registry_admin_password
  }

  dns_service_principal = {
    client_id     = var.client_id
    client_secret = var.client_secret
    tenant_id     = var.tenant_id
  }

  main_dns_zone_name = data.terraform_remote_state.main.outputs.dns_zone_name
  main_aci_subnet_id = data.terraform_remote_state.main.outputs.aci_subnet_id
}
