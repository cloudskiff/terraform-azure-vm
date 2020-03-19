variable "azure_region" {
  type        = string
  default     = "useast"
  description = "Azure Region"
}

variable "vm_size" {
  type        = string
  default     = "Standard_DS1"
  description = "Azure VM Size"
}

variable "ssh_public_key" {
  type        = string
  default     = "ssh-rsa AAAAB3Nz{snip}hwhqT9h"
  description = "SSH Public Key"
}

variable "admin_username" {
  type        = string
  default     = "azureuser"
  description = "Azure VM Administrator User"
}

variable "network_address_space" {
  default     = ["10.0.0.0/16"]
  description = "Virtual Network Address Space"
  type        = list
}
