variable "security_group_name" {
  type = string
  description = "kubernetes security group name"
}

variable "instance_key" {
	type = string
	description = "Key to ssh"
}

variable "master_nodes_count" {
  type = number
  description = "Count of master nodes to create"
}

variable "worker_nodes_count" {
  type = number
  description = "Count of master nodes to create"
}