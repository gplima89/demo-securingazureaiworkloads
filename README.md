# Azure AI Security Demo: Perimeter Control with Azure AI Foundry and API Management

## 🎯 Scenario Overview

Contoso Corporation is deploying an internal AI-powered assistant using Azure AI Foundry. To protect sensitive data, they want to ensure the AI model is only accessible through trusted channels. This demo shows how to:

- Restrict public access to Azure AI Foundry
- Use Azure API Management (APIM) as a secure gateway
- Enforce perimeter control using Azure Network Security Perimeter (NSP)

## 🧱 Architecture

- **Azure AI Foundry**: Hosts the AI model, with public access disabled.
- **Azure API Management**: Gateway for secure access to the AI model.
- **Network Security Perimeter**: Restricts inbound traffic to Foundry, allowing only APIM.
- **Key Vault & Storage**: Required dependencies for Foundry.

https://user-images.githubusercontent.com/placeholder/azure-ai-security-arch.png

## ✅ Outcome

You now have a secure Azure AI deployment:

- AI model is protected from public access
- Only APIM can reach the model
- All traffic is logged and controlled

## 📎 Resources

- [Azure AI Foundry NSP Guide](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/add-foundry-to-network-security-perimeter)
- [Terraform Registry: azurerm_ai_foundry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/ai_foundry)
- [Import Azure OpenAI API into APIM](https://learn.microsoft.com/en-us/azure/api-management/azure-openai-api-from-specification)
---

➡️ [Continue to Setup Instructions](Setup.md)
