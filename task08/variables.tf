variable "resources_name_prefix" {
  type        = string
  description = "Prefix for all resource names"
}

variable "location" {
  type        = string
  description = "Azure region location"
  default     = "East US"
}

variable "student_email" {
  type        = string
  description = "Student email for Creator tag"
}

variable "tags" {
  type        = map(string)
  description = "Common tags to apply to all resources"
  default     = {}
}


variable "redis_capacity" {
  type        = number
  description = "Redis capacity"
  default     = 1
}

variable "redis_sku" {
  type        = string
  description = "Redis SKU"
  default     = "Basic"
}

variable "redis_sku_family" {
  type        = string
  description = "Redis SKU family"
  default     = "C"
}

variable "redis_primary_key" {
  type        = string
  description = "Secret name for Redis primary key"
  default     = "redis-primary-key"
}

variable "redis_hostname" {
  type        = string
  description = "Secret name for Redis hostname"
  default     = "redis-hostname"
}

variable "keyvault_sku" {
  type        = string
  description = "Key Vault SKU"
  default     = "standard"
}

variable "acr_sku" {
  type        = string
  description = "ACR SKU"
  default     = "Standard"
}

variable "image_name" {
  type        = string
  description = "Docker image name"
  default     = "redis-flask-app"
}

variable "image_tag" {
  type        = string
  description = "Image tag"
  default     = "latest"
}

variable "acr_context_path" {
  type        = string
  description = "Git repository URL for ACR task context"
}

variable "git_pat" {
  type        = string
  description = "Personal access token for the repository where the source code is located"
  sensitive   = true
  default     = null
}

variable "aci_sku" {
  type        = string
  description = "ACI SKU"
  default     = "Standard"
}

variable "aks_node_pool_name" {
  type        = string
  description = "AKS default node pool name"
  default     = "default"
}

variable "aks_node_pool_count" {
  type        = number
  description = "AKS default node pool instance count"
  default     = 2
}

variable "aks_node_pool_size" {
  type        = string
  description = "AKS default node pool instance node size"
  default     = "Standard_D2_v2"
}

variable "aks_node_pool_disk_type" {
  type        = string
  description = "AKS default node pool os disk type"
  default     = "Managed"
}

variable "key_vault_key_id" {
  type        = string
  description = "Key Vault Key ID for AKS encryption"
  default     = null
}
