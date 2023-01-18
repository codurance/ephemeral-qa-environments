variable "environment" {
  type        = string
  description = "The environment name."
}

variable "project" {
  type        = string
  description = "The project name."
}

variable "environment_id" {
  type        = string
  description = "Ephemeral environment id."
}

variable "subscription_id" {
  type        = string
  description = "The Azure account subscription id."
}

variable "client_id" {
  type        = string
  description = "The Azure Service Principal client id."
}

variable "client_secret" {
  type        = string
  description = "The Azure Service Principal client secret."
}

variable "tenant_id" {
  type        = string
  description = "The Azure Service Principal tenant id."
}

variable "main_remote_state_resource_group_name" {
  type        = string
  description = "The resource group name where the remote state storage account lives."
}

variable "main_remote_state_storage_account_name" {
  type        = string
  description = "The storage account name of the remote state."
}

variable "main_remote_state_container_name" {
  type        = string
  description = "The container name where the remote state lives."
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to associate with your resources."

  default = {
    environment = "dev",
    created_by  = "terraform"
  }
}

variable "employees_docker_image_name" {
  type        = string
  description = "The employees container name."
  default     = "employees"
}

variable "employees_docker_image_tag" {
  type        = string
  description = "The employees container tag."
  default     = "latest"
}

variable "employees_docker_image_port" {
  type        = number
  description = "The employees container port."
  default     = 4567
}

variable "payroll_docker_image_name" {
  type        = string
  description = "The payroll container name."
  default     = "payroll"
}

variable "payroll_docker_image_tag" {
  type        = string
  description = "The payroll container tag."
  default     = "latest"
}

variable "payroll_docker_image_port" {
  type        = number
  description = "The payroll container port."
  default     = 4567
}
