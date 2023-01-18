locals {
  name = "${var.prefix}-acg-${var.name}"
}

resource "azurerm_container_group" "acg" {
  name                = local.name
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location
  subnet_ids          = [var.subnet_id]
  ip_address_type     = "Private"
  os_type             = "Linux"
  restart_policy      = "OnFailure"

  image_registry_credential {
    server   = var.container_registry.server
    username = var.container_registry.username
    password = var.container_registry.password
  }

  container {
    name   = var.name
    image  = "${var.container_registry.server}/${var.docker_image_name}:${var.docker_image_tag}"
    cpu    = var.cpu
    memory = var.memory

    dynamic "ports" {
      for_each = var.ports

      content {
        port     = ports.value.number
        protocol = ports.value.protocol
      }
    }

    environment_variables = var.environment_variables
  }

  container {
    name   = "dns-sidecar"
    image  = "${var.container_registry.server}/${var.dns_sidecar_docker_image_name}:${var.dns_sidecar_docker_image_tag}"
    cpu    = var.dns_sidecar_cpu
    memory = var.dns_sidecar_memory

    environment_variables = {
      "ACI_INSTANCE_NAME" : local.name
      "RESOURCE_GROUP" : var.resource_group.name
      "A_RECORD_NAME" : var.dns_record_name
      "DNS_ZONE_NAME" : var.dns_zone_name
    }

    /*
        Note: Ideally a managed identity would be used here, but since managed identities are not supported in a
        container group deployed to a virtual network, this module relies on service principal credentials.
    */
    secure_environment_variables = {
      "APP_ID" : var.dns_service_principal.client_id
      "APP_PASSWORD" : var.dns_service_principal.client_secret
      "APP_TENANT_ID" : var.dns_service_principal.tenant_id
    }
  }

  tags = var.tags
}
