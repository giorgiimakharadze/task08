output "aci_fqdn" {
  value       = module.aci.fqdn
  description = "ACI FQDN"
}

output "aks_lb_ip" {
  value       = try(data.kubernetes_service_v1.app_service.status[0].load_balancer[0].ingress[0].ip, "pending")
  description = "Load Balancer IP address of APP in AKS"
}

