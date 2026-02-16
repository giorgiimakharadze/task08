output "id" {
  value       = azurerm_redis_cache.redis.id
  description = "Redis Cache ID"
}

output "name" {
  value       = azurerm_redis_cache.redis.name
  description = "Redis Cache name"
}

output "hostname" {
  value       = azurerm_redis_cache.redis.hostname
  description = "Redis hostname"
}

output "ssl_port" {
  value       = azurerm_redis_cache.redis.ssl_port
  description = "Redis SSL port (6380)"
}

output "primary_access_key" {
  value       = azurerm_redis_cache.redis.primary_access_key
  description = "Redis primary access key"
  sensitive   = true
}

output "secondary_access_key" {
  value       = azurerm_redis_cache.redis.secondary_access_key
  description = "Redis secondary access key"
  sensitive   = true
}

output "hostname_secret_id" {
  value       = azurerm_key_vault_secret.hostname.id
  description = "Key Vault secret ID for Redis hostname"
}

output "primary_key_secret_id" {
  value       = azurerm_key_vault_secret.primary-key.id
  description = "Key Vault secret ID for Redis primary key"
}
