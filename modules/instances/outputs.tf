output "kubemaster_ip" {
    value = aws_instance.master.public_ip
    description = "kubemaster public IP"
}

output "node01_ip" {
    value = aws_instance.node01.public_ip
    description = "node01 public IP"
}