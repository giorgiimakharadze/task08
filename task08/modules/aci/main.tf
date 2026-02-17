resource "azurerm_container_group" "aci" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  os_type             = var.os_type
  dns_name_label      = var.dns_name_label
  ip_address_type     = var.ip_address_type
  sku                 = var.sku
  image_registry_credential {
    server   = var.acr_login_server
    username = var.acr_admin_username
    password = var.acr_admin_password
  }

  container {
    name   = var.container_name
    image  = var.container_image
    cpu    = var.cpu
    memory = var.memory

    dynamic "ports" {
      for_each = var.ports
      content {
        port     = ports.value.port
        protocol = ports.value.protocol
      }
    }

    environment_variables        = var.environment_variables
    secure_environment_variables = var.secure_environment_variables
  }

  tags = var.tags
}
