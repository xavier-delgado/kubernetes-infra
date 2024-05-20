output "kubemaster_ip" {
    value = module.instances.kubemaster_ip
    description = "kubemaster public IP"
}

output "node01_ip" {
    value = module.instances.node01_ip
    description = "node01 public IP"
}