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

resource "aws_security_group_rule" "icmp_egress_rule" {
	from_port = -1
	to_port = -1
	protocol = "icmp"
	type = "egress"
	security_group_id = aws_security_group.kubernetes_sg.id
	source_security_group_id = aws_security_group.kubernetes_sg.id
}

resource "aws_security_group_rule" "ssh_ingress_rule_internal" {
	from_port = 22
	to_port = 22
	protocol = "tcp"
	type = "ingress"
	security_group_id = aws_security_group.kubernetes_sg.id
	source_security_group_id = aws_security_group.kubernetes_sg.id
}

resource "aws_security_group_rule" "ssh_egress_rule_internal" {
	from_port = 22
	to_port = 22
	protocol = "tcp"
	type = "egress"
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

resource "aws_security_group_rule" "https_ingress_rule_internal" {
	from_port = 6443
	to_port = 6443
	protocol = "tcp"
	type = "ingress"
	security_group_id = aws_security_group.kubernetes_sg.id
	source_security_group_id = aws_security_group.kubernetes_sg.id
}

resource "aws_security_group_rule" "https_egress_rule_internal" {
	from_port = 6443
	to_port = 6443
	protocol = "tcp"
	type = "egress"
	security_group_id = aws_security_group.kubernetes_sg.id
	source_security_group_id = aws_security_group.kubernetes_sg.id
}

resource "aws_security_group_rule" "https_egress_rule" {
	from_port = 443
	to_port = 443
	protocol = "tcp"
	type = "egress"
	security_group_id = aws_security_group.kubernetes_sg.id
	cidr_blocks = [ "0.0.0.0/0" ]
}

resource "aws_security_group_rule" "http_egress_rule" {
	from_port = 80
	to_port = 80
	protocol = "tcp"
	type = "egress"
	security_group_id = aws_security_group.kubernetes_sg.id
	cidr_blocks = [ "0.0.0.0/0" ]
}