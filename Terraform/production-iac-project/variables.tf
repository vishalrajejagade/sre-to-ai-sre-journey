variable "storage_account_name" {
  description = "Storage account name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where resources exist"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
  default     = {}
}

variable "admin_password" {
  description = "Admin password for Linux VM"
}

 