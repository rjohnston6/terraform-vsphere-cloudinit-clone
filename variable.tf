# vCenter Authentication Variables

variable "vsphere_user" {
  type = string
}

variable "vsphere_password" {
  type      = string
  sensitive = true
}

variable "vsphere_server" {
  type = string
}

variable "vsphere_allow_unverified" {
  type        = bool
  description = "Set to True for self-signed certificates on vcenter otherwise use false"
  default     = true
}

# Variables for VM deployment
variable "vsphere_dc" {
  type        = string
  description = "vCenter DC to deploy machines in."
}

variable "vsphere_datastore" {
  type = string
}

variable "vsphere_pool" {
  type    = string
  default = ""
}

variable "vsphere_dvs" {
  type    = string
  default = ""
}

variable "vsphere_network" {
  type = string
}

variable "vsphere_template" {
  type = string
}

variable "vsphere_folder" {
  type = string
}

variable "vm_name" {
  type    = string
  default = "terrafrom_vm"
}

variable "vm_user" {
  type    = string
  default = "sysadmin"
}

variable "vm_password" {
  type      = string
  sensitive = true
}

variable "vm_ssh_key" {
  type      = string
  sensitive = true
}

variable "vm_ip" {
  type = string
}

variable "vm_gateway" {
  type = string
}

variable "vm_netmask" {
  type = string
}

variable "vm_dns" {
  description = "Sting of comma seperated DNS server addresses"
  type        = string
  default     = "8.8.8.8"
}

variable "vm_disk_label" {
  type = string
}
