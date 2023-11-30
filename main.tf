/**
  * ## Description
  *
  * Ce module root sert à déployer :
  *   - 1 Azure Resource Group pour le SFTPv2
  *   - 1 Storage Account avec Hierarchical Namespace et SFTP activés
  *   - 1 Container Storage
  *   - 1 Recovery Services Vault
*/

# Création d'un groupe de ressources Azure
resource "azurerm_resource_group" "resourceGroupe" {
  name     = "RG-${var.environment}-${local.project}"
  location = var.location
  tags     = local.rg_tags
}

# Appel du module de stockage Azure
module "storage_account" {
  source              = "./modules/terraform-azurerm-az-storage-account"
  location            = var.location
  environment         = var.environment
  resource_group_name = azurerm_resource_group.resourceGroupe.name
  depends_on          = [azurerm_resource_group.resourceGroupe]
}

# Appel du module de conteneur Azure
module "container_storage" {
  source              = "./modules/terraform-azurerm-az-container-storage"
  container_name      = var.container_name
  location            = var.location
  environment         = var.environment
  resource_group_name = azurerm_resource_group.resourceGroupe.name
}


