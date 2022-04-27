locals {
  cloud-init_vars = {
    hostname   = var.vm_name
    user       = var.vm_user
    password   = var.vm_password
    ssh_key    = var.vm_ssh_key
    vm_ip      = "${var.vm_ip}/${var.vm_netmask}"
    vm_gateway = var.vm_gateway
    # netmask  = var.vm_netmask
    vm_dns = var.vm_dns
  }
  vm_notes_string = var.vm_notes != null ? "${var.vm_notes}\n\nBase Template: ${var.vsphere_template}\n\nDate Created: ${formatdate("MMM DD YYYY hh:mm ZZZ", timestamp())}" : "Base Template: ${var.vsphere_template}\n\nDate Created: ${formatdate("MMM DD YYYY hh:mm ZZZ", timestamp())}"
}

data "vsphere_datacenter" "dc" {
  name = var.vsphere_dc
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.vsphere_cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  count         = var.vsphere_pool != "" ? 1 : 0
  name          = var.vsphere_pool
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  # Name of VM Template to clone
  name          = var.vsphere_template_folder != null ? "/${var.vsphere_dc}/vm/${var.vsphere_template_folder}/${var.vsphere_template}" : "/${var.vsphere_dc}/vm/${var.vsphere_folder}/${var.vsphere_template}"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_distributed_virtual_switch" "dvs" {
  count         = var.vsphere_dvs != "" ? 1 : 0
  name          = var.vsphere_dvs
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "vm_network" {
  name                            = var.vsphere_network
  datacenter_id                   = data.vsphere_datacenter.dc.id
  distributed_virtual_switch_uuid = var.vsphere_dvs != "" ? data.vsphere_distributed_virtual_switch.dvs[0].id : null
}

resource "vsphere_virtual_machine" "vm" {
  name             = var.vm_name
  resource_pool_id = var.vsphere_pool != "" ? data.vsphere_resource_pool.pool[0].id : data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder           = var.vsphere_folder != null ? var.vsphere_folder : null

  num_cpus  = var.vm_cpus != null ? var.vm_cpus : data.vsphere_virtual_machine.template.num_cpus
  memory    = var.vm_ram != null ? var.vm_ram : data.vsphere_virtual_machine.template.memory
  guest_id  = data.vsphere_virtual_machine.template.guest_id
  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  annotation = local.vm_notes_string
  network_interface {
    network_id   = data.vsphere_network.vm_network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = "${var.vm_name}-disk"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  cdrom {
    client_device = true
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }

  extra_config = {
    "guestinfo.metadata"          = base64encode(templatefile("${path.module}/templates/metadata.yaml", local.cloud-init_vars))
    "guestinfo.metadata.encoding" = "base64"
    "guestinfo.userdata"          = base64encode(templatefile("${path.module}/templates/userdata.yaml", local.cloud-init_vars))
    "guestinfo.userdata.encoding" = "base64"
  }

  lifecycle {
    ignore_changes = [
      annotation,
      clone[0].template_uuid,
      clone[0].customize[0].dns_server_list,
      clone[0].customize[0].network_interface[0]
    ]
  }

}
