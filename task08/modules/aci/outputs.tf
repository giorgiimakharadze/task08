output "id" {
  description = "The ID of the Container Group"
  value       = azurerm_container_group.aci.id
}

output "name" {
  description = "The name of the Container Group"
  value       = azurerm_container_group.aci.name
}

output "ip_address" {
  description = "The IP address of the Container Group"
  value       = azurerm_container_group.aci.ip_address
}

output "fqdn" {
  description = "The FQDN of the Container Group"
  value       = azurerm_container_group.aci.fqdn
}
