# Azure Infrastructure Lab with Terraform
_Azure / Terraform / DevOps project by Aniron Abraham_

## Overview

This project provisions a production-style Azure infrastructure environment using Terraform.

The goal of this lab is to build a realistic Infrastructure as Code foundation that reflects how cloud infrastructure is managed in real environments, while also serving as a portfolio project for Azure / DevOps engineering work.

The project currently includes:

- Azure Resource Group deployment
- Virtual Network and Subnets
- Network Security Group and subnet associations
- Linux Virtual Machine on a private subnet
- Modular Terraform structure
- Environment separation (`dev`, `staging`, `prod`)
- Remote Terraform state in Azure Storage
- GitHub Actions CI for Terraform validation and planning
- Secure Azure authentication using a Service Principal and Azure Key Vault

---

## Goals of This Project

This lab was built to practice and demonstrate:

- Terraform fundamentals
- Modular Terraform design
- Multi-environment infrastructure layout
- Remote state management
- Azure networking and compute provisioning
- Secure secret handling
- CI/CD validation for Terraform workflows

---

## Architecture

### Current `dev` environment includes

- **Resource Group**
  - `rg-terraform-lab-1`

- **Networking**
  - Virtual Network: `demo-vnet`
  - App Subnet: `10.0.1.0/24`
  - DB Subnet: `10.0.2.0/24`
  - Network Security Group: `demo-nsg`

- **Compute**
  - Linux VM: `vm-linux-01`
  - NIC: `nic-linux-01`
  - VM deployed without a public IP

- **Security / State**
  - Azure Key Vault in separate security resource group
  - Remote Terraform state stored in Azure Storage

---

## Repository Structure

```text
terraform/
├── environments/
│   ├── dev/
│   ├── staging/
│   └── prod/
│
├── modules/
│   ├── network/
│   └── compute/
│
├── .github/
│   └── workflows/
│       ├── terraform-validate.yml
│       └── terraform-plan.yml
│
├── README.md
```

### Folder Purpose

- `modules/network`  
  Contains reusable Terraform code for:
  - VNet
  - Subnets
  - NSG
  - NSG associations

- `modules/compute`  
  Contains reusable Terraform code for:
  - NIC
  - Linux VM

- `environments/dev`  
  Active development environment using the shared modules

- `environments/staging` and `environments/prod`  
  Environment skeletons prepared for expansion

---

## Authentication and Secret Handling

This project does **not** store Azure credentials in Terraform files or in Git.

Authentication is handled using:

- Azure Service Principal
- Azure Key Vault
- Environment variables (`ARM_CLIENT_ID`, `ARM_CLIENT_SECRET`, `ARM_SUBSCRIPTION_ID`, `ARM_TENANT_ID`)

Secrets are retrieved from Key Vault using helper scripts for local development.

### Local auth helper scripts
- `load-terraform-env.ps1`
- `load-terraform-env.sh`

These scripts load Azure credentials into environment variables before running Terraform.

---

## Remote State

Terraform state is stored remotely in Azure Storage using the `azurerm` backend.

This provides:

- centralized state
- safer collaboration patterns
- state locking
- CI/CD compatibility
- protection against local state loss

Each environment has its own backend key, for example:

- `dev.tfstate`
- `staging.tfstate`
- `prod.tfstate`

---

## CI/CD

GitHub Actions is used for Terraform validation and planning.

### Workflows

- **Terraform Validate**
  - runs on push and pull request
  - checks formatting and validates configuration

- **Terraform Plan**
  - runs on pull requests and manual trigger
  - initializes Terraform and generates a plan for the `dev` environment

This helps catch:
- formatting issues
- configuration errors
- unintended infrastructure changes

---

## How to Use

### 1. Load Azure credentials
Use either PowerShell or Bash helper scripts to load environment variables from Azure Key Vault.

#### PowerShell
```powershell
.\load-terraform-env.ps1
```

#### Bash
```bash
source ./load-terraform-env.sh
```

---

### 2. Move into the desired environment
```bash
cd terraform/environments/dev
```

---

### 3. Initialize Terraform
```bash
terraform init
```

---

### 4. Review the plan
```bash
terraform plan
```

---

### 5. Apply changes
```bash
terraform apply
```

---

## Notes

- The Linux VM is deployed without a public IP.
- Azure Bastion was tested during development and later removed to reduce lab cost.
- The Key Vault was intentionally separated into its own resource group to keep security infrastructure separate from workload infrastructure.
- `staging` and `prod` currently exist as environment scaffolding and are not yet deployed.

---

## Lessons Learned

This project involved solving several real-world Terraform and Azure issues, including:

- importing pre-existing Azure resources into Terraform state
- recovering from provider/state inconsistencies
- handling stale remote state locks
- refactoring flat Terraform into modules without recreating infrastructure
- moving from local state to remote state
- setting up CI workflows for Terraform validation and planning
- securely handling Azure credentials outside of code

---

## Next Steps

Planned next steps for this project include:

- expanding `staging` and `prod`
- improving README documentation with diagrams
- adding an AKS module
- deploying Kubernetes workloads
- extending CI/CD automation

---

## Tools Used

- Terraform
- Microsoft Azure
- Azure CLI
- Azure Key Vault
- Azure Storage
- GitHub Actions
- Git
- Bash / PowerShell

---

## Author

Created by Aniron Abraham as part of an Azure / Terraform / DevOps learning project focused on building production-style cloud infrastructure and portfolio-ready Infrastructure as Code.
