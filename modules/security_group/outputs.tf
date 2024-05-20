output "security_group_name" {
  value = aws_security_group.kubernetes_sg.name
  description = "Security group name"
}