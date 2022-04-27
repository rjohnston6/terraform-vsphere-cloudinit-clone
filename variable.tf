# Variables for VM deployment
variable "vsphere_dc" {
  type        = string
  description = "vCenter DC to deploy machines in."
}

variable "vsphere_datastore" {
  type = string
}

variable "vsphere_cluster" {
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

variable "vsphere_template_folder" {
  description = "Path to template location if different the folder used for deployed VM"
  type        = string
  default     = null
}

variable "vsphere_template" {
  type = string
}

variable "vsphere_folder" {
  type    = string
  default = null
}

variable "vm_name" {
  type    = string
  default = "terrafrom_vm"
}

variable "vm_cpus" {
  type    = number
  default = null
}

variable "vm_ram" {
  type    = number
  default = null
}

variable "vm_notes" {
  type        = string
  default     = null
  description = "Custom notes for VM details"
}

variable "vm_user" {
  type    = string
  default = "sysadmin"
}

variable "vm_password" {
  type      = string
  sensitive = true
  default   = ""
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
