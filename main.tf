# Resource Group
resource "azurerm_resource_group" "demo" {
  name     = "ai-security-demo-rg"
  location = "eastus"
}

# Storage Account
resource "azurerm_storage_account" "foundry_storage" {
  name                     = "aifoundrystorage${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.demo.name
  location                 = azurerm_resource_group.demo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Key Vault
resource "azurerm_key_vault" "foundry_kv" {
  name                = "ai-foundry-kv-${random_string.suffix.result}"
  resource_group_name = azurerm_resource_group.demo.name
  location            = azurerm_resource_group.demo.location
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
  purge_protection_enabled = false
}

# AI Services
resource "azurerm_ai_services" "ai_base" {
  name                = "demo-ai-services"
  resource_group_name = azurerm_resource_group.demo.name
  location            = azurerm_resource_group.demo.location
  sku_name            = "S0"
}

# AI Foundry Hub
resource "azurerm_ai_foundry" "foundry_hub" {
  name                = "demo-foundry-hub"
  resource_group_name = azurerm_resource_group.demo.name
  location            = azurerm_ai_services.ai_base.location
  storage_account_id  = azurerm_storage_account.foundry_storage.id
  key_vault_id        = azurerm_key_vault.foundry_kv.id
  sku_name            = "S0"
  public_network_access = "Disabled"

  identity {
    type = "SystemAssigned"
  }
}

# AI Foundry Project
resource "azurerm_ai_foundry_project" "foundry_project" {
  name               = "contoso-ai-project"
  resource_group_name = azurerm_resource_group.demo.name
  location           = azurerm_ai_foundry.foundry_hub.location
  ai_foundry_id      = azurerm_ai_foundry.foundry_hub.id

  identity {
    type = "SystemAssigned"
  }
}

# API Management
resource "random_string" "suffix" {
  length  = 6
  numeric = false
  special = false
}

resource "azurerm_api_management" "api_gateway" {
  name                = "ai-secure-apim-${random_string.suffix.result}"
  resource_group_name = azurerm_resource_group.demo.name
  location            = azurerm_resource_group.demo.location
  publisher_name      = "Contoso"
  publisher_email     = "admin@contoso.com"
  sku_name            = "Developer_1"
}
