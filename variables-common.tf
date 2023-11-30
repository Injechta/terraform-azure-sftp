# Variables système/globales, ne modifiez pas ce fichier !!
locals {
  release = "LocalDebug.Version-x"

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

# Data sources du Cloud Azure
data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {}

# Variables d'entrée communes
variable "environment" {
  description = "Nom de l'environnement"
  type        = string
}

variable "location" {
  description = "Région d'hébergement du Cloud Azure"
  type        = string
}

variable "container_name" {
  description = "Nom du conteneur Azure"
  type        = string
}

