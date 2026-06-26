resource "azurerm_virtual_machine_extension" "nginx" {
  name                 = "install-nginx"
  virtual_machine_id   = var.vm_id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  settings = jsonencode({
    commandToExecute = "sudo apt-get update -y && sudo apt-get install -y nginx && sudo systemctl enable nginx && sudo systemctl start nginx && echo '<h1>Deployed by Terraform - Nginx is running</h1>' | sudo tee /var/www/html/index.html"
  })
}