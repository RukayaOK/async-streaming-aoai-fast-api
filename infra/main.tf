resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_cognitive_account" "ai_services" {
  for_each = { for open_ai_instance in var.open_ai_instances : open_ai_instance.name => open_ai_instance }

  name                          = each.value.name
  location                      = each.value.region
  resource_group_name           = azurerm_resource_group.resource_group.name
  kind                          = "OpenAI"
  sku_name                      = each.value.sku
  custom_subdomain_name         = each.value.custom_subdomain_name
  public_network_access_enabled = true

}

resource "azurerm_cognitive_deployment" "model" {
  for_each = { for open_ai_instance_model in local.open_ai_instance_models : open_ai_instance_model.model_name => open_ai_instance_model }

  name                 = each.value.model_name
  cognitive_account_id = azurerm_cognitive_account.ai_services[each.value.instance_name].id

  model {
    format  = "OpenAI"
    name    = each.value.model_name
    version = each.value.model_version
  }

  scale {
    type = "Standard"
  }
}