output "id" {
  value       = azurerm_kubernetes_cluster.aks.id
  description = "AKS cluster ID"
}

output "name" {
  value       = azurerm_kubernetes_cluster.aks.name
  description = "AKS cluster name"
}

output "kube_config" {
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  description = "Kubernetes configuration"
  sensitive   = true
}

output "kubelet_identity_object_id" {
  value       = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  description = "Kubelet identity object ID"
}

output "cluster_identity_principal_id" {
  value       = azurerm_kubernetes_cluster.aks.identity[0].principal_id
  description = "AKS cluster identity principal ID"
}

output "fqdn" {
  value       = azurerm_kubernetes_cluster.aks.fqdn
  description = "AKS cluster FQDN"
}
