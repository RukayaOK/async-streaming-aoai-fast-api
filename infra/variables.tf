variable "location" {
  type        = string
  description = "Azure location"
}

variable "resource_group_name" {
  type        = string
  description = "Azure Resource Group Name"
}

variable "open_ai_instances" {
  type = list(object({
    name                  = string
    region                = string
    sku                   = string
    custom_subdomain_name = string
    models = list(object({
      name    = string
      version = string
    }))
  }))
  description = "List of Azure OpenAI instances and Models"
}
