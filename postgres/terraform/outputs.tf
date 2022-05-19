output "access_key_id" {
	value = module.azure.access_key_id
	sensitive = true
}


output "secret_access_key" {
	value = module.azure.secret_access_key
	sensitive = true
}


