output "subnet_id" {
  description = "Subnet ID"
  value       = azurerm_subnet.subnet.id
}

output "vnet_name" {
  description = "Virtual Network name"
  value       = azurerm_virtual_network.vnet.name
}