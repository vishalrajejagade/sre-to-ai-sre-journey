terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatevishal123"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}


provider "azurerm" {
  features {}
}

module "resource_group" {
  source = "./modules/resource-group"

  rg_name  = var.resource_group_name
  location = var.location

  tags = {
    owner = "test"
  }
}

module "network" {
  source = "./modules/network"

  vnet_name           = "demo-vnet"
  subnet_name         = "demo-subnet"
  resource_group_name = module.resource_group.rg_name
  location            = var.location
}

module "nsg" {
  source = "./modules/nsg"

  nsg_name            = "demo-nsg"
  resource_group_name = module.resource_group.rg_name
  location            = var.location
}

module "nic" {
  source = "./modules/nic"

  nic_name            = "demo-nic"
  resource_group_name = module.resource_group.rg_name
  location            = var.location
  subnet_id           = module.network.subnet_id
}

module "vm" {
  source = "./modules/vm"

  vm_name             = "demo-vm"
  resource_group_name = module.resource_group.rg_name
  location            = var.location
  nic_id              = module.nic.nic_id
}