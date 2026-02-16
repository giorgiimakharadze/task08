variable "name" {
  type        = string
  description = "Redis Cache Name"
}

variable "location" {
  type        = string
  description = "Location"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

variable "capacity" {
  type        = number
  description = "Capacity"
}

variable "family" {
  type        = string
  description = "Family"
}

variable "sku_name" {
  type        = string
  description = "SKU Name"
}

variable "tags" {
  type        = map(string)
  description = "Tags"
  default     = {}
}

variable "key_vault_id" {
  type        = string
  description = "Key Vault ID"
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Enable public network access to Redis"
  default     = true
}
