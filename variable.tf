# Variables for VM deployment
variable "vsphere_dc" {
  type        = string
  description = "vCenter DC to deploy machines in."
}

variable "vsphere_datastore" {
  type        = string
  description = "Name of Datastore for VM deployment"
}

variable "vsphere_cluster" {
  type        = string
  description = "Cluster to deploy VM to."
}

variable "vsphere_pool" {
  type        = string
  default     = ""
  description = "Name of Resource pool to deploy to, if NO resource pool is defined default cluster Resource Pool will be used"
}

variable "vsphere_dvs" {
  type        = string
  default     = ""
  description = "Name of Distributed vSwitch for deployment, if not provided it will be ignored"
}

variable "vsphere_mgmt_network" {
  type        = string
  description = "Managment network interface configured on vnic 1 of vm."
}
variable "vsphere_network" {
  type        = list(string)
  description = "List of of Port groups to be used for additional network attachment for VM in order of network interfaces for multi-interface deployments."
  default     = null
}

variable "vsphere_template_folder" {
  description = "Path to template location if different the folder used for deployed VM"
  type        = string
  default     = null
}

variable "vsphere_template" {
  type        = string
  description = "Name of template to be cloned for deployment"
}

variable "vsphere_folder" {
  type        = string
  default     = null
  description = "Folder to place VM in, if not provided VM will be deployed to the root of the cluster"
}

variable "vm_name" {
  type        = string
  default     = "terrafrom_vm"
  description = "Name of VM will also be used as the hostname as part of OS customization with cloud-init."
}

variable "vm_cpus" {
  type        = number
  default     = null
  description = "If set will configure VM with the desired CPU count, if NOT the template VM settings will be used."
}

variable "vm_ram" {
  type        = number
  default     = null
  description = "If set will configure VM with the desired memory size, if NOT the template VM settings will be used."
}

variable "vm_notes" {
  type        = string
  default     = null
  description = "Custom notes for VM details"
}

variable "vm_user" {
  type        = string
  default     = "sysadmin"
  description = "Username for OS authentication"
}

variable "vm_password" {
  type        = string
  sensitive   = true
  default     = ""
  description = "Set only if absolutely needed, If set userdata.yaml template requires customization. Use SSH Keys for authentication is preferred! Password for OS authentication"
}

variable "vm_ssh_key" {
  type        = string
  sensitive   = true
  description = "SSH Key to be configured in authorized keys on OS for the provided user"
}

variable "vm_ip" {
  type        = string
  description = "Static IP Address to configure on VM"
}

variable "vm_gateway" {
  type        = string
  description = "Default Gateway for VM"
}

variable "vm_netmask" {
  type        = string
  description = "CIDR length of subnet mask eg. 24"
}

variable "vm_dns" {
  description = "Sting of comma seperated DNS server addresses"
  type        = string
  default     = "8.8.8.8"
}

variable "routes" {
  type = object({
    ip_addr = string
    gateway = string
    cidr    = string
  })
  default = {
    ip_addr = null
    gateway = null
    cidr    = null
  }
}
