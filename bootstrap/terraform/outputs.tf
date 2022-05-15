output "kubelet_msi_id" {
	value = module.azure-bootstrap.kubelet_msi_id
	sensitive = true
}


output "node_resource_group" {
	value = module.azure-bootstrap.node_resource_group
	sensitive = true
}


