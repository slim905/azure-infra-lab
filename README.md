# Azure Terraform Project – Virtual Network and VM Deployment

## Overview
This Terraform project provisions a basic Azure environment consisting of a virtual network, subnet, network security group, virtual machine, and storage account.

## Architecture
- **VNet:** 10.0.0.0/16
- **Subnet:** 10.0.1.0/24
- **VM:** Ubuntu 20.04 with SSH access
- **Storage Account:** Standard_LRS

## Repository Structure
├── bastion.tf
├── compute.tf
├── main.tf
├── networking.tf
├── outputs.tf
├── provider.tf
├── variables.tf
├── versions.tf
└── README.md

## Prerequisites
- Azure subscription
- Terraform v1.6+
- Azure CLI logged in (`az login`)

## Usage
```bash
terraform init
terraform plan
terraform apply