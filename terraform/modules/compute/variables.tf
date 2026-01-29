variable "resource_group_name" {
  type        = string
  description = "Resource group name for compute resources"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where the NIC will be placed"
}

variable "nic_name" {
  type        = string
  description = "NIC name"
}

variable "vm_name" {
  type        = string
  description = "VM name"
}

variable "vm_size" {
  type        = string
  description = "VM size"
}

variable "admin_username" {
  type        = string
  description = "Admin username for the Linux VM"
}

variable "ssh_public_key_path" {
  type        = string
  description = "Path to SSH public key file"
}
