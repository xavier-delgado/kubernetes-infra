resource "aws_key_pair" "instance_key" {
  key_name = "instance_keys"
  public_key = var.instance_key
}

resource "aws_instance" "master" {

  ami = "ami-080e1f13689e07408"
  instance_type = "t2.micro"
  tags = {
    Name = "kubemaster"
  }
  security_groups = [ var.security_group_name ]
  key_name = aws_key_pair.instance_key.key_name
}

resource "aws_instance" "node01" {

  ami = "ami-080e1f13689e07408"
  instance_type = "t2.micro"
  tags = {
    Name = "node01"
  }
  security_groups = [ var.security_group_name ]
  key_name = aws_key_pair.instance_key.key_name
}