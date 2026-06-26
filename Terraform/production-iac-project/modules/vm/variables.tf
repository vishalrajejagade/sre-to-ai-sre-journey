variable "vm_name" {
  description = "Virtual Machine name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "nic_id" {
  description = "Network Interface ID"
  type        = string
}

variable "admin_password" {
  description = "Admin password for VM"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
  default     = {}
}
