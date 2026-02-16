variable "name" {
  type        = string
  description = "ACI Name"
}

variable "rg_name" {
  type        = string
  description = "Resource Group Name"
}

variable "location" {
  type        = string
  description = "Location"
}

variable "os_type" {
  type        = string
  description = "OS type for the container group (Linux or Windows)"
  default     = "Linux"
}

variable "dns_name_label" {
  type        = string
  description = "DNS name label for the container group"
  default     = null
}

variable "ip_address_type" {
  type        = string
  description = "IP address type (Public or Private)"
  default     = "Public"
}

variable "acr_login_server" {
  type        = string
  description = "ACR login server URL"
}

variable "acr_admin_username" {
  type        = string
  description = "ACR admin username"
}

variable "acr_admin_password" {
  type        = string
  description = "ACR admin password"
  sensitive   = true
}

variable "container_name" {
  type        = string
  description = "Name of the container"
}

variable "container_image" {
  type        = string
  description = "Container image from ACR"
}

variable "cpu" {
  type        = number
  description = "Number of CPU cores"
  default     = 1
}

variable "memory" {
  type        = number
  description = "Memory in GB"
  default     = 1.5
}

variable "ports" {
  type = list(object({
    port     = number
    protocol = string
  }))
  description = "List of ports to expose"
  default = [{
    port     = 80
    protocol = "TCP"
  }]
}

variable "environment_variables" {
  type        = map(string)
  description = "Environment variables for the container"
  default     = {}
}

variable "secure_environment_variables" {
  type        = map(string)
  description = "Secure environment variables for the container"
  default     = {}
  sensitive   = true
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {}
}

variable "sku" {
  type        = string
  description = "SKU for ACI"
}
