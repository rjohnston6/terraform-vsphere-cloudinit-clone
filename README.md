## Title of REPO


Content for Cloud init template configuration from SamGabrial @ TekanAid
https://tekanaid.com/posts/build-a-kubernetes-k3s-cluster-in-vsphere-with-terraform-and-packer#code

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.1 |
| <a name="requirement_vsphere"></a> [vsphere](#requirement\_vsphere) | 2.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_template"></a> [template](#provider\_template) | n/a |
| <a name="provider_vsphere"></a> [vsphere](#provider\_vsphere) | 2.1.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vsphere_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/vsphere/2.1.1/docs/resources/virtual_machine) | resource |
| [template_file.meta-data](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [vsphere_compute_cluster.cluster](https://registry.terraform.io/providers/hashicorp/vsphere/2.1.1/docs/data-sources/compute_cluster) | data source |
| [vsphere_datacenter.dc](https://registry.terraform.io/providers/hashicorp/vsphere/2.1.1/docs/data-sources/datacenter) | data source |
| [vsphere_datastore.datastore](https://registry.terraform.io/providers/hashicorp/vsphere/2.1.1/docs/data-sources/datastore) | data source |
| [vsphere_distributed_virtual_switch.dvs](https://registry.terraform.io/providers/hashicorp/vsphere/2.1.1/docs/data-sources/distributed_virtual_switch) | data source |
| [vsphere_network.vm_mgmt_network](https://registry.terraform.io/providers/hashicorp/vsphere/2.1.1/docs/data-sources/network) | data source |
| [vsphere_network.vm_network](https://registry.terraform.io/providers/hashicorp/vsphere/2.1.1/docs/data-sources/network) | data source |
| [vsphere_resource_pool.pool](https://registry.terraform.io/providers/hashicorp/vsphere/2.1.1/docs/data-sources/resource_pool) | data source |
| [vsphere_virtual_machine.template](https://registry.terraform.io/providers/hashicorp/vsphere/2.1.1/docs/data-sources/virtual_machine) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_routes"></a> [routes](#input\_routes) | n/a | <pre>object({<br>    ip_addr = string<br>    gateway = string<br>    cidr    = string<br>  })</pre> | <pre>{<br>  "cidr": null,<br>  "gateway": null,<br>  "ip_addr": null<br>}</pre> | no |
| <a name="input_vm_cpus"></a> [vm\_cpus](#input\_vm\_cpus) | If set will configure VM with the desired CPU count, if NOT the template VM settings will be used. | `number` | `null` | no |
| <a name="input_vm_dns"></a> [vm\_dns](#input\_vm\_dns) | Sting of comma seperated DNS server addresses | `string` | `"8.8.8.8"` | no |
| <a name="input_vm_gateway"></a> [vm\_gateway](#input\_vm\_gateway) | Default Gateway for VM | `string` | n/a | yes |
| <a name="input_vm_ip"></a> [vm\_ip](#input\_vm\_ip) | Static IP Address to configure on VM | `string` | n/a | yes |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Name of VM will also be used as the hostname as part of OS customization with cloud-init. | `string` | `"terrafrom_vm"` | no |
| <a name="input_vm_netmask"></a> [vm\_netmask](#input\_vm\_netmask) | CIDR length of subnet mask eg. 24 | `string` | n/a | yes |
| <a name="input_vm_notes"></a> [vm\_notes](#input\_vm\_notes) | Custom notes for VM details | `string` | `null` | no |
| <a name="input_vm_password"></a> [vm\_password](#input\_vm\_password) | Set only if absolutely needed, If set userdata.yaml template requires customization. Use SSH Keys for authentication is preferred! Password for OS authentication | `string` | `""` | no |
| <a name="input_vm_ram"></a> [vm\_ram](#input\_vm\_ram) | If set will configure VM with the desired memory size, if NOT the template VM settings will be used. | `number` | `null` | no |
| <a name="input_vm_ssh_key"></a> [vm\_ssh\_key](#input\_vm\_ssh\_key) | SSH Key to be configured in authorized keys on OS for the provided user | `string` | n/a | yes |
| <a name="input_vm_user"></a> [vm\_user](#input\_vm\_user) | Username for OS authentication | `string` | `"sysadmin"` | no |
| <a name="input_vsphere_cluster"></a> [vsphere\_cluster](#input\_vsphere\_cluster) | Cluster to deploy VM to. | `string` | n/a | yes |
| <a name="input_vsphere_datastore"></a> [vsphere\_datastore](#input\_vsphere\_datastore) | Name of Datastore for VM deployment | `string` | n/a | yes |
| <a name="input_vsphere_dc"></a> [vsphere\_dc](#input\_vsphere\_dc) | vCenter DC to deploy machines in. | `string` | n/a | yes |
| <a name="input_vsphere_dvs"></a> [vsphere\_dvs](#input\_vsphere\_dvs) | Name of Distributed vSwitch for deployment, if not provided it will be ignored | `string` | `""` | no |
| <a name="input_vsphere_folder"></a> [vsphere\_folder](#input\_vsphere\_folder) | Folder to place VM in, if not provided VM will be deployed to the root of the cluster | `string` | `null` | no |
| <a name="input_vsphere_mgmt_network"></a> [vsphere\_mgmt\_network](#input\_vsphere\_mgmt\_network) | Managment network interface configured on vnic 1 of vm. | `string` | n/a | yes |
| <a name="input_vsphere_network"></a> [vsphere\_network](#input\_vsphere\_network) | List of of Port groups to be used for additional network attachment for VM in order of network interfaces for multi-interface deployments. | `list(string)` | `null` | no |
| <a name="input_vsphere_pool"></a> [vsphere\_pool](#input\_vsphere\_pool) | Name of Resource pool to deploy to, if NO resource pool is defined default cluster Resource Pool will be used | `string` | `""` | no |
| <a name="input_vsphere_template"></a> [vsphere\_template](#input\_vsphere\_template) | Name of template to be cloned for deployment | `string` | n/a | yes |
| <a name="input_vsphere_template_folder"></a> [vsphere\_template\_folder](#input\_vsphere\_template\_folder) | Path to template location if different the folder used for deployed VM | `string` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
