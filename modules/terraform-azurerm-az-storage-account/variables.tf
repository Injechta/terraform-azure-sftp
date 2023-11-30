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
}
