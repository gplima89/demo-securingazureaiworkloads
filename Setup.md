# Setup Instructions for Azure AI Security Demo

## 🛠️ Prerequisites

- Azure subscription with sufficient permissions
- Terraform CLI installed
- Azure CLI installed (for NSP preview registration)

## 1. Enable Network Security Perimeter Preview

Run the following Azure CLI commands:

```bash
az feature registration create --name OpenAI.NspPreview --namespace Microsoft.CognitiveServices
az feature registration create --name AllowNSPInPublicPreview --namespace Microsoft.Network
az provider register --namespace Microsoft.CognitiveServices
az provider register --namespace Microsoft.Network

---

⬅️ [Back to Overview](README.md) | ➡️ [Continue to Execition Instructions](Setup.md)
