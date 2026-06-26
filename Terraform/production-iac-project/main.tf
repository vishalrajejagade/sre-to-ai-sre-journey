module "storage" {
  source = "./modules/storage"

  storage_account_name = var.storage_account_name
  resource_group_name  = var.resource_group_name
  location             = var.location

  tags = var.tags
}

module "network" {
  source = "./modules/network"

  vnet_name           = "demo-vnet"
  subnet_name         = "demo-subnet"
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = var.tags
}

module "public_ip" {
  source = "./modules/public-ip"

  public_ip_name      = "demo-pip"
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = var.tags
}

module "nic" {
  source = "./modules/nic"

  nic_name            = "demo-nic"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = module.network.subnet_id
  public_ip_id        = module.public_ip.public_ip_id

  tags = var.tags
}

module "nsg" {
  source = "./modules/nsg"

  nsg_name            = "demo-nsg"
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = var.tags
}



module "nsg_association" {
  source = "./modules/nsg-association"

  nic_id = module.nic.nic_id
  nsg_id = module.nsg.nsg_id
}
module "vm" {
  source = "./modules/vm"

  vm_name             = "demo-vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  nic_id              = module.nic.nic_id
  admin_password      = var.admin_password

  tags = var.tags
}
module "nginx_extension" {
  source = "./modules/nginx-extension"

  vm_id = module.vm.vm_id
}