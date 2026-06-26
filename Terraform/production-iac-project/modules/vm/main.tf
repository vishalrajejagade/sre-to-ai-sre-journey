resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_B1s"

  admin_username = "azureuser"
  admin_password = var.admin_password

  disable_password_authentication = false

  network_interface_ids = [
    var.nic_id
  ]

  custom_data = base64encode(<<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y nginx
              systemctl enable nginx
              systemctl start nginx
              echo "<h1>Deployed by Terraform - Nginx is running</h1>" > /var/www/html/index.html
              EOF
  )

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  tags = var.tags
}