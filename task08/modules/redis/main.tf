resource "azurerm_redis_cache" "redis" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  capacity                      = var.capacity
  family                        = var.family
  sku_name                      = var.sku_name
  public_network_access_enabled = var.public_network_access_enabled
  minimum_tls_version           = "1.2"
  tags                          = var.tags
}


resource "azurerm_key_vault_secret" "hostname" {
  name         = "redis-hostname"
  value        = azurerm_redis_cache.redis.hostname
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "primary-key" {
  name         = "redis-primary-key"
  value        = azurerm_redis_cache.redis.primary_access_key
  key_vault_id = var.key_vault_id
}
