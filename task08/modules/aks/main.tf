resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  tags                = var.tags

  default_node_pool {
    name         = var.node_name
    node_count   = var.node_count
    vm_size      = var.node_size
    os_disk_type = var.os_disk_type
  }

  identity {
    type = "SystemAssigned"
  }

  dynamic "key_management_service" {
    for_each = var.key_vault_key_id != null ? [1] : []
    content {
      key_vault_key_id = var.key_vault_key_id
    }
  }

  storage_profile {
    blob_driver_enabled = var.blob_driver_enabled
    disk_driver_enabled = var.disk_driver_enabled
    file_driver_enabled = var.file_driver_enabled
  }
}

resource "azurerm_role_assignment" "aks_acr_pull" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = var.acr_id
  skip_service_principal_aad_check = true
}

resource "azurerm_key_vault_access_policy" "aks_keyvault" {
  key_vault_id = var.key_vault_id
  tenant_id    = azurerm_kubernetes_cluster.aks.identity[0].tenant_id
  object_id    = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id

  secret_permissions = [
    "Get",
    "List"
  ]

  key_permissions = [
    "Get",
    "List"
  ]

  certificate_permissions = [
    "Get",
    "List"
  ]
}
