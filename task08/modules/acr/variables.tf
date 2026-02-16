variable "name" {
  type        = string
  description = "ACR name"
}

variable "location" {
  type        = string
  description = "ACR location"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "sku" {
  type        = string
  description = "ACR SKU"
}

variable "admin_enabled" {
  type        = bool
  description = "Enable admin user"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {}
}

variable "task_name" {
  type        = string
  description = "Name of the ACR task"
}

variable "task_platform_os" {
  type        = string
  description = "OS platform for the ACR task"
  default     = "Linux"
}

variable "dockerfile_path" {
  type        = string
  description = "Path to Dockerfile in the context"
  default     = "Dockerfile"
}

variable "context_path" {
  type        = string
  description = "URL to the source code repository or path"
}

variable "context_access_token" {
  type        = string
  description = "Access token for the source code repository"
  sensitive   = true
  default     = null
}

variable "image_names" {
  type        = list(string)
  description = "List of image names to build and tag"
}

variable "build_arguments" {
  type        = map(string)
  description = "Build arguments for Docker build"
  default     = {}
}

variable "agent_cpu" {
  type        = number
  description = "CPU cores for the build agent"
  default     = 2
}
