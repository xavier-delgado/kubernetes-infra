output "master_ips" {
    value = module.instances.master_ips[*]
    description = "master public IP's"
}

output "worker_ips" {
    value = module.instances.worker_ips[*]
    description = "worker public IP's"
}