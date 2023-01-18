module "employees" {
  source = "./modules/container"

  prefix                = local.prefix
  resource_group        = local.resource_group
  subnet_id             = local.main_aci_subnet_id
  dns_zone_name         = local.main_dns_zone_name
  container_registry    = local.main_container_registry
  dns_service_principal = local.dns_service_principal

  name              = "employees"
  dns_record_name   = "employees-${local.environment_id}"
  cpu               = "1"
  memory            = "1"
  docker_image_name = var.employees_docker_image_name
  docker_image_tag  = var.employees_docker_image_tag
  ports = [{
    number   = var.employees_docker_image_port
    protocol = "TCP"
  }]

  tags = var.tags
}

module "payroll" {
  source = "./modules/container"

  prefix                = local.prefix
  resource_group        = local.resource_group
  subnet_id             = local.main_aci_subnet_id
  dns_zone_name         = local.main_dns_zone_name
  container_registry    = local.main_container_registry
  dns_service_principal = local.dns_service_principal

  name              = "payroll"
  dns_record_name   = "payroll-${local.environment_id}"
  cpu               = "1"
  memory            = "1"
  docker_image_name = var.payroll_docker_image_name
  docker_image_tag  = var.payroll_docker_image_tag
  ports = [{
    number   = var.payroll_docker_image_port
    protocol = "TCP"
  }]
  environment_variables = {
    "EMPLOYEES_URL_PROTOCOL" = "http"
    "EMPLOYEES_URL_HOST"     = "employees-${local.environment_id}.${local.main_dns_zone_name}"
    "EMPLOYEES_URL_PORT"     = "4567"
  }

  tags = var.tags
}
