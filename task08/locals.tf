locals {
  rg_name       = "${var.resources_name_prefix}-rg"
  aci_name      = "${var.resources_name_prefix}-aci"
  acr_name      = lower(replace("${var.resources_name_prefix}acr", "-", ""))
  aks_name      = "${var.resources_name_prefix}-aks"
  keyvault_name = lower(replace("${var.resources_name_prefix}kv", "-", ""))
  redis_name    = "${var.resources_name_prefix}-redis"
}
