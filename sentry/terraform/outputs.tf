output "access_key_id" {
	value = module.azure.access_key_id
	sensitive = true
}


output "secret_access_key" {
	value = module.azure.secret_access_key
	sensitive = true
}


output "rabbitmq_password" {
	value = module.secrets.rabbitmq_password
	sensitive = true
}


output "rabbitmq_username" {
	value = module.secrets.rabbitmq_username
	sensitive = true
}


output "redis_password" {
	value = module.secrets.redis_password
	sensitive = true
}


