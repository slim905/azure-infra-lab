variable "resource_group_name" {
  type        = string
  description = "Resource group name for AKS"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "cluster_name" {
  type        = string
  description = "AKS cluster name"
}

variable "dns_prefix" {
  type        = string
  description = "DNS prefix for AKS"
}

variable "kubernetes_version" {
  type        = string
  description = "AKS Kubernetes version"
}

variable "node_count" {
  type        = number
  description = "System node pool count"
}

variable "vm_size" {
  type        = string
  description = "System node pool VM size"
}

variable "aks_subnet_id" {
  type        = string
  description = "Subnet ID for AKS nodes"
}

variable "pod_cidr" {
  type        = string
  description = "Pod CIDR for Azure CNI Overlay"
}

variable "service_cidr" {
  type        = string
  description = "Service CIDR for Kubernetes services"
}

variable "dns_service_ip" {
  type        = string
  description = "DNS service IP inside the service CIDR"
}