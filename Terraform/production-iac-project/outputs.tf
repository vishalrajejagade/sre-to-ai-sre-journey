output "resource_group_name" {
  description = "Resource group name"
  value       = var.resource_group_name
}

output "public_ip_address" {
  description = "Public IP address of the VM"
  value       = module.public_ip.public_ip_address
}