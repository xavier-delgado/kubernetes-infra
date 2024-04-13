resource "aws_security_group" "kubernetes_sg" {
	name = "kubernetes_security_group"
	description = "Enabling ICMP and TCP between servers"
}

resource "aws_security_group_rule" "tcp_ingress_rule" {
	from_port = 0
	to_port = 65535
	protocol = "tcp"
	type = "ingress"
	security_group_id = aws_security_group.kubernetes_sg.id
	source_security_group_id = aws_security_group.kubernetes_sg.id
}

resource "aws_security_group_rule" "icmp_ingress_rule" {
	from_port = -1
	to_port = -1
	protocol = "icmp"
	type = "ingress"
	security_group_id = aws_security_group.kubernetes_sg.id
	source_security_group_id = aws_security_group.kubernetes_sg.id
}

resource "aws_security_group_rule" "ssh_ingress_rule" {
	from_port = 22
	to_port = 22
	protocol = "tcp"
	type = "ingress"
	security_group_id = aws_security_group.kubernetes_sg.id
	cidr_blocks = [ "0.0.0.0/0" ]
}