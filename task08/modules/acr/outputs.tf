output "id" {
  value       = azurerm_container_registry.acr.id
  description = "ACR ID"
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "acr_admin_username" {
  value = azurerm_container_registry.acr.admin_username
}

output "acr_admin_password" {
  value     = azurerm_container_registry.acr.admin_password
  sensitive = true
}

output "task_id" {
  value       = azurerm_container_registry_task.acr_task.id
  description = "ACR Task ID"
}

output "task_name" {
  value       = azurerm_container_registry_task.acr_task.name
  description = "ACR Task Name"
}
