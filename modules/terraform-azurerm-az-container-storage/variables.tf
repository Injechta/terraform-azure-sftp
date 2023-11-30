variable "container_name" {
  description = "Nom du conteneur Azure"
  type        = string
}
variable "location" {
  description = "Région d'hébergement du Cloud Azure"
  type        = string
}
variable "environment" {
  description = "Nom de l'environnement"
  type        = string
}
variable "resource_group_name" {
  description = "Nom du groupe de ressources Azure"
  type        = string
}
locals {
  release = "LocalDebug.Version-x"
  project = "SFTPV2"
  # Tagging -->
  common_tags = {
    environment = var.environment
    project     = local.project
  }
  rg_tags = merge({
    release = local.release
  }, local.common_tags)

  # Azure location
  location = var.location

   # Azure storage account name
  storage_account_name = "stg${lower(var.environment)}${lower(local.project)}"

  storage_account = {
    name                     = local.storage_account_name
    resource_group_name      = var.resource_group_name
    location                 = var.location
    account_tier             = "Standard"
    account_replication_type = "LRS"
    is_hns_enabled = true
    sftp_enabled = true
  }
}
