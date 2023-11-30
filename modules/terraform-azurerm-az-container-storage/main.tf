/**
  * ## Description
  *
  * Ce module root sert à déployer :
  *   - Un Azure Container Storage
*/

# Création du Container Storage

resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  storage_account_name  = local.storage_account_name
  container_access_type = "private"
}








