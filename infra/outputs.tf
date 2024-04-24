output "name" {
  value = {
    for cognitive_account in azurerm_cognitive_account.ai_services :
    cognitive_account.name => cognitive_account.name
  }
}

output "ai_services_id" {
  value = {
    for cognitive_account in azurerm_cognitive_account.ai_services :
    cognitive_account.name => cognitive_account.id
  }
}

output "primary_access_key" {
  value = {
    for cognitive_account in azurerm_cognitive_account.ai_services :
    cognitive_account.name => cognitive_account.primary_access_key
  }
  sensitive = true
}

output "ai_subdomain" {
  value = {
    for cognitive_account in azurerm_cognitive_account.ai_services :
    cognitive_account.name => cognitive_account.custom_subdomain_name
  }
  description = "The subdomain used to connect to the AI Service Account."
}

output "cognitive_service_deployments" {
  value       = azurerm_cognitive_deployment.model
  description = "List of AI service deployments"
}