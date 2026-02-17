resources_name_prefix = "cmtr-2lfxdvp4-mod8"

student_email = "giorgi_makharadze@epam.com"

tags = {
  Creator = "giorgi_makharadze@epam.com"
}

# Azure Redis Cache
redis_capacity    = 2
redis_sku         = "Basic"
redis_sku_family  = "C"
redis_primary_key = "redis-primary-key"
redis_hostname    = "redis-hostname"

# Azure Key Vault
keyvault_sku = "standard"

# Azure Container Registry
acr_sku    = "Basic"
image_name = "cmtr-2lfxdvp4-mod8-app"

# Azure Container Instance
aci_sku = "Standard"

# Azure Kubernetes Service
aks_node_pool_name      = "system"
aks_node_pool_count     = 1
aks_node_pool_size      = "Standard_D2ads_v6"
aks_node_pool_disk_type = "Ephemeral"
