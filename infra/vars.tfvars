location            = "uksouth"
resource_group_name = "azure-open-ai-test-rg"

open_ai_instances = [
  {
    name                  = "dev-openai-one"
    region                = "uksouth"
    sku                   = "S0"
    custom_subdomain_name = "ai-service-dev-openai-1"
    models = [
      {
        name    = "gpt-35-turbo"
        version = "0301"
      },
    ]
  },
]