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
| <a name="provider_vsphere"></a> [vsphere](#provider\_vsphere) | 2.1.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vsphere_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/vsphere/2.1.1/docs/resources/virtual_machine) | resource |
| [vsphere_compute_cluster.cluster](https://registry.terraform.io/providers/hashicorp/vsphere/2.1.1/docs/data-sources/compute_cluster) | data source |
| [vsphere_datacenter.dc](https://registry.terraform.io/providers/hashicorp/vsphere/2.1.1/docs/data-sources/datacenter) | data source |
| [vsphere_datastore.datastore](https://registry.terraform.io/providers/hashicorp/vsphere/2.1.1/docs/data-sources/datastore) | data source |
| [vsphere_distributed_virtual_switch.dvs](https://registry.terraform.io/providers/hashicorp/vsphere/2.1.1/docs/data-sources/distributed_virtual_switch) | data source |
| [vsphere_network.vm_network](https://registry.terraform.io/providers/hashicorp/vsphere/2.1.1/docs/data-sources/network) | data source |
| [vsphere_resource_pool.pool](https://registry.terraform.io/providers/hashicorp/vsphere/2.1.1/docs/data-sources/resource_pool) | data source |
| [vsphere_virtual_machine.template](https://registry.terraform.io/providers/hashicorp/vsphere/2.1.1/docs/data-sources/virtual_machine) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vm_cpus"></a> [vm\_cpus](#input\_vm\_cpus) | n/a | `number` | `null` | no |
| <a name="input_vm_dns"></a> [vm\_dns](#input\_vm\_dns) | Sting of comma seperated DNS server addresses | `string` | `"8.8.8.8"` | no |
| <a name="input_vm_gateway"></a> [vm\_gateway](#input\_vm\_gateway) | n/a | `string` | n/a | yes |
| <a name="input_vm_ip"></a> [vm\_ip](#input\_vm\_ip) | n/a | `string` | n/a | yes |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | n/a | `string` | `"terrafrom_vm"` | no |
| <a name="input_vm_netmask"></a> [vm\_netmask](#input\_vm\_netmask) | n/a | `string` | n/a | yes |
| <a name="input_vm_notes"></a> [vm\_notes](#input\_vm\_notes) | Custom notes for VM details | `string` | `null` | no |
| <a name="input_vm_password"></a> [vm\_password](#input\_vm\_password) | n/a | `string` | `""` | no |
| <a name="input_vm_ram"></a> [vm\_ram](#input\_vm\_ram) | n/a | `number` | `null` | no |
| <a name="input_vm_ssh_key"></a> [vm\_ssh\_key](#input\_vm\_ssh\_key) | n/a | `string` | n/a | yes |
| <a name="input_vm_user"></a> [vm\_user](#input\_vm\_user) | n/a | `string` | `"sysadmin"` | no |
| <a name="input_vsphere_cluster"></a> [vsphere\_cluster](#input\_vsphere\_cluster) | n/a | `string` | n/a | yes |
| <a name="input_vsphere_datastore"></a> [vsphere\_datastore](#input\_vsphere\_datastore) | n/a | `string` | n/a | yes |
| <a name="input_vsphere_dc"></a> [vsphere\_dc](#input\_vsphere\_dc) | vCenter DC to deploy machines in. | `string` | n/a | yes |
| <a name="input_vsphere_dvs"></a> [vsphere\_dvs](#input\_vsphere\_dvs) | n/a | `string` | `""` | no |
| <a name="input_vsphere_folder"></a> [vsphere\_folder](#input\_vsphere\_folder) | n/a | `string` | `null` | no |
| <a name="input_vsphere_network"></a> [vsphere\_network](#input\_vsphere\_network) | n/a | `string` | n/a | yes |
| <a name="input_vsphere_pool"></a> [vsphere\_pool](#input\_vsphere\_pool) | n/a | `string` | `""` | no |
| <a name="input_vsphere_template"></a> [vsphere\_template](#input\_vsphere\_template) | n/a | `string` | n/a | yes |
| <a name="input_vsphere_template_folder"></a> [vsphere\_template\_folder](#input\_vsphere\_template\_folder) | Path to template location if different the folder used for deployed VM | `string` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
