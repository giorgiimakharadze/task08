output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "Resource Group name"
}
output "acr_login_server" {
  value       = module.acr.acr_login_server
  description = "ACR login server URL"
}

output "acr_name" {
  value       = module.acr.acr_admin_username
  description = "ACR name"
}

output "aks_cluster_name" {
  value       = module.aks.name
  description = "AKS cluster name"
}

output "aks_fqdn" {
  value       = module.aks.fqdn
  description = "AKS cluster FQDN"
}

output "aci_ip_address" {
  value       = module.aci.ip_address
  description = "ACI IP address"
}

output "aci_fqdn" {
  value       = module.aci.fqdn
  description = "ACI FQDN"
}

output "key_vault_name" {
  value       = module.keyvault.name
  description = "Key Vault name"
}

output "key_vault_uri" {
  value       = module.keyvault.vault_uri
  description = "Key Vault URI"
}

output "redis_hostname" {
  value       = module.redis.hostname
  description = "Redis hostname"
}

output "redis_ssl_port" {
  value       = module.redis.ssl_port
  description = "Redis SSL port (6380)"
}

output "k8s_loadbalancer_ip" {
  value       = try(data.kubernetes_service.app_service.status[0].load_balancer[0].ingress[0].ip, "pending")
  description = "Kubernetes LoadBalancer IP address"
}
