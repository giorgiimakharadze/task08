resource "azurerm_container_registry" "acr" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  admin_enabled       = var.admin_enabled
  tags                = var.tags
}

resource "azurerm_container_registry_task" "acr_task" {
  name                  = var.task_name
  container_registry_id = azurerm_container_registry.acr.id
  tags                  = var.tags

  platform {
    os = var.task_platform_os
  }

  docker_step {
    dockerfile_path      = var.dockerfile_path
    context_path         = var.context_path
    context_access_token = var.context_access_token
    image_names          = var.image_names
    arguments            = var.build_arguments
  }

  agent_setting {
    cpu = var.agent_cpu
  }
}

resource "azurerm_container_registry_task_schedule_run_now" "schedule" {
  container_registry_task_id = azurerm_container_registry_task.acr_task.id
}
