variable "name" {
  type        = string
  description = "AKS name"
}

variable "node_name" {
  type        = string
  description = "node name"
}

variable "location" {
  type        = string
  description = "Location"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "node_count" {
  type        = number
  description = "Number of nodes"
}

variable "node_size" {
  type        = string
  description = "Node size"
}

variable "os_disk_type" {
  type        = string
  description = "OS disk type for the default node pool"
  default     = "Managed"
}

variable "tags" {
  type        = map(string)
  description = "Tags"
  default     = {}
}

variable "key_vault_key_id" {
  type        = string
  description = "Key Vault Key ID"
}

variable "blob_driver_enabled" {
  type        = bool
  description = "Blob driver enabled"
  default     = true
}

variable "disk_driver_enabled" {
  type        = bool
  description = "Disk driver enabled"
  default     = true
}

variable "file_driver_enabled" {
  type        = bool
  description = "File driver enabled"
  default     = true
}

variable "dns_prefix" {
  type        = string
  description = "DNS prefix for the AKS cluster"
}

variable "acr_id" {
  type        = string
  description = "Azure Container Registry ID for role assignment"
}

variable "key_vault_id" {
  type        = string
  description = "Key Vault ID for access policy"
}

variable "os_disk_size_gb" {
  type        = number
  description = "OS disk size in GB"
  default     = 30
}
