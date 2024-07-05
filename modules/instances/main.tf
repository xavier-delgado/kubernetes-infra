terraform {
  required_providers {
    ansible = {
      version = "~> 1.3.0"
      source  = "ansible/ansible"
    }
  }
}

resource "aws_key_pair" "instance_key" {
  key_name = "instance_keys"
  public_key = var.instance_key
}

resource "aws_instance" "master" {
  count = var.master_nodes_count

  ami = "ami-080e1f13689e07408"
  instance_type = "t2.micro"
  tags = {
    Name = "master-${count.index + 1}"
  }
  security_groups = [ var.security_group_name ]
  key_name = aws_key_pair.instance_key.key_name
}

resource "aws_instance" "worker" {
  count = var.worker_nodes_count

  ami = "ami-080e1f13689e07408"
  instance_type = "t2.micro"
  tags = {
    Name = "worker-${count.index + 1}"
  }
  security_groups = [ var.security_group_name ]
  key_name = aws_key_pair.instance_key.key_name
}

resource "ansible_host" "master" {
  count = length(aws_instance.master)

  name = aws_instance.master[count.index].public_dns
  groups = ["master"]
}

resource "ansible_host" "worker" {
  count = length(aws_instance.worker)

  name = aws_instance.worker[count.index].public_dns
  groups = ["worker"]
}