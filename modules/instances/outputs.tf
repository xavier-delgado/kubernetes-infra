output "master_ips" {
    value = aws_instance.master[*].public_ip
    description = "master nodes public IP's"
}

output "worker_ips" {
    value = aws_instance.worker[*].public_ip
    description = "worker nodes public IP's"
}