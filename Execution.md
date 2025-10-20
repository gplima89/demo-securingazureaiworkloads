# Execution Guide: Azure AI Security Demo

This guide walks you through the final steps of the Azure AI perimeter control demo, assuming you've already deployed the infrastructure using Terraform.

---

## 🔐 Step 3: Configure Network Security Perimeter (NSP)

1. Go to the Azure Portal and search for "Network Security Perimeter".
2. Create a new perimeter and a perimeter profile.
3. In the perimeter resource, go to **Associated Resources** and click **Add**.
4. Select your Azure AI Foundry resource (e.g., `demo-foundry-hub`) and set the access mode to **Learning**.
5. Add an inbound access rule to allow traffic from your API Management instance:
   - If APIM is public, use its public IP address.
   - If APIM is in a VNet, allow the subnet range.
6. Once verified, switch the access mode to **Enforced**.

> ✅ In Enforced mode, only traffic from APIM will reach the Foundry resource. All other traffic is blocked.

---

## 🌐 Step 4: Import API into Azure API Management

1. In the Azure Portal, open your API Management instance.
2. Go to **APIs** > **+ Add API**.
3. Choose **Create from Azure Resource** and select **Azure OpenAI**.
4. Select your Azure AI Foundry resource and deployment.
5. Configure:
   - Display name and description
   - Base URL (e.g., `https://your-apim.azure-api.net/openai`)
   - Authentication method (API key or managed identity)
6. Optionally enable policies:
   - Token usage tracking
   - Semantic caching
   - AI content safety

> 🔐 If using managed identity, assign the appropriate role (e.g., Cognitive Services OpenAI User) to APIM in the Foundry resource IAM settings.

---

## 🧪 Step 5: Test the Setup

### ✅ Test via APIM

- Use the APIM test console or Postman to send a request to the AI endpoint.
- Include the required headers (e.g., `Ocp-Apim-Subscription-Key`).
- Confirm that the response is returned successfully.

### ❌ Test Direct Access (Blocked)

- Try calling the Foundry endpoint directly using curl or Postman.
- You should receive a 403 error or timeout.
- This confirms that perimeter control is working.

### 📊 Monitor Logs

- In the Network Security Perimeter resource, enable diagnostics.
- View denied traffic logs and successful access from APIM.
- In APIM, check metrics and logs for API usage.

---

## ✅ Summary

You now have:

- A locked-down Azure AI Foundry service
- Secure access via Azure API Management
- Enforced perimeter rules with logging and diagnostics

This setup demonstrates enterprise-grade security for Azure AI workloads.

---

⬅️ [Back to Setup Instructions](Setup.md)
