/**
  * ## Description
  *
  * Ce module root sert à déployer :
  *   - 1 Azure Storage Account avec Hierarchical Namespace et SFTP activés
*/

# Création d'un compte de stockage Azure avec Hierarchical Namespace et SFTP activés
resource "azurerm_storage_account" "stockage" {
  name                     = "stg${lower(var.environment)}${lower(local.project)}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled = true
  sftp_enabled = true
}

