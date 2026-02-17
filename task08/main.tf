data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags     = var.tags
}

module "keyvault" {
  source = "./modules/keyvault"

  name                = local.keyvault_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = var.keyvault_sku
  tags                = var.tags

  depends_on = [azurerm_resource_group.rg]
}

module "acr" {
  source = "./modules/acr"

  name                = local.acr_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = var.acr_sku
  admin_enabled       = true

  task_name            = "${local.acr_name}-build-task"
  task_platform_os     = "Linux"
  context_path         = var.acr_context_path
  context_access_token = var.git_pat
  image_names          = ["${local.acr_name}.azurecr.io/${var.image_name}:${var.image_tag}"]

  tags = var.tags

  depends_on = [azurerm_resource_group.rg]
}

module "redis" {
  source = "./modules/redis"

  name                = local.redis_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  capacity            = var.redis_capacity
  family              = var.redis_sku_family
  sku_name            = var.redis_sku
  key_vault_id        = module.keyvault.id

  tags = var.tags

  depends_on = [module.keyvault]
}


module "aks" {
  source = "./modules/aks"

  name                = local.aks_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "${local.aks_name}-dns"

  node_name    = var.aks_node_pool_name
  node_count   = var.aks_node_pool_count
  node_size    = var.aks_node_pool_size
  os_disk_type = var.aks_node_pool_disk_type

  acr_id           = module.acr.id
  key_vault_id     = module.keyvault.id
  key_vault_key_id = var.key_vault_key_id

  blob_driver_enabled = true
  disk_driver_enabled = true
  file_driver_enabled = true

  tags = var.tags

  depends_on = [module.acr, module.keyvault]
}

module "aci" {
  source = "./modules/aci"

  name           = local.aci_name
  location       = var.location
  rg_name        = azurerm_resource_group.rg.name
  sku            = var.aci_sku
  dns_name_label = local.aci_name

  acr_login_server   = module.acr.acr_login_server
  acr_admin_username = module.acr.acr_admin_username
  acr_admin_password = module.acr.acr_admin_password

  container_name  = "redis-flask-app"
  container_image = "${module.acr.acr_login_server}/${var.image_name}:${var.image_tag}"
  cpu             = 1
  memory          = 1.5

  ports = [{
    port     = 8080
    protocol = "TCP"
  }]

  environment_variables = {
    CREATOR        = "ACI"
    REDIS_PORT     = "6380"
    REDIS_SSL_MODE = "true"
  }

  secure_environment_variables = {
    REDIS_URL = module.redis.hostname
    REDIS_PWD = module.redis.primary_access_key
  }

  tags = var.tags

  depends_on = [module.acr, module.redis]
}

resource "kubectl_manifest" "secret_provider" {
  yaml_body = templatefile("${path.module}/k8s-manifests/secret-provider.yaml.tftpl", {
    aks_kv_access_identity_id  = module.aks.kubelet_identity_object_id
    kv_name                    = module.keyvault.name
    redis_url_secret_name      = var.redis_hostname
    redis_password_secret_name = var.redis_primary_key
    tenant_id                  = data.azurerm_client_config.current.tenant_id
  })

  depends_on = [module.aks, module.keyvault, module.redis]
}

resource "kubectl_manifest" "deployment" {
  yaml_body = templatefile("${path.module}/k8s-manifests/deployment.yaml.tftpl", {
    acr_login_server = module.acr.acr_login_server
    app_image_name   = var.image_name
    image_tag        = var.image_tag
  })

  wait_for {
    field {
      key   = "status.readyReplicas"
      value = 1
    }
  }

  depends_on = [kubectl_manifest.secret_provider]
}

resource "kubectl_manifest" "service" {
  yaml_body = file("${path.module}/k8s-manifests/service.yaml")

  wait_for {
    field {
      key   = "status.loadBalancer.ingress.0.ip"
      value = "regex:^\\d+\\.\\d+\\.\\d+\\.\\d+$"
    }
  }

  depends_on = [kubectl_manifest.deployment]
}

data "kubernetes_service" "app_service" {
  metadata {
    name = "redis-flask-app-service"
  }

  depends_on = [kubectl_manifest.service]
}
