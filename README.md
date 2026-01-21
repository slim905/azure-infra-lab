# 🚀 Azure Terraform Infrastructure Project  
**Production-Style Virtual Network & Virtual Machine Deployment**

## 📌 Overview
The goal of this project is to showcase my ability to:
- Build **repeatable, predictable Azure environments**
- Apply **Azure networking, security, and compute fundamentals**
- Structure Terraform code in a **clean, scalable, and maintainable way**


---

## 🏗️ Architecture Overview
The infrastructure provisions the following Azure resources:

- **Virtual Network (VNet)**
  - Address space: `10.0.0.0/16`
- **Subnet**
  - Address range: `10.0.1.0/24`
- **Network Security Group (NSG)**
  - Controls inbound and outbound traffic at the subnet level
- **Linux Virtual Machine**
  - Ubuntu 20.04 LTS
  - SSH-based access (no password authentication)
- **Azure Storage Account**
  - SKU: `Standard_LRS`
  - Intended for diagnostics, logs, or future state/data usage

---

## 📁 Repository Structure

```text
├── compute.tf        # Virtual machine and compute resources
├── networking.tf    # VNet, subnet, and NSG definitions
├── main.tf          # Resource orchestration
├── provider.tf      # Azure provider configuration
├── variables.tf     # Input variables for flexibility
├── outputs.tf       # Outputs for integration and visibility
├── versions.tf      # Terraform and provider version pinning
└── README.md
