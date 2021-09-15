###### MY IP ######
data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

resource "aws_security_group" "sg" {
  name        = "${var.owner}-ssh-sg"
  description = "Allow inbound traffic via SSH"
  vpc_id      = aws_vpc.vpc.id

  ingress = [
    {
      description      = "My public IP ssh"
      protocol         = var.sg_ingress_protocol
      from_port        = var.sg_ingress_ssh
      to_port          = var.sg_ingress_ssh
      cidr_blocks      = ["${chomp(data.http.myip.body)}/32"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false

  }]
  tags = {
    "Owner" = var.owner
    "Name"  = "${var.owner}-sg-ssh"
  }
}

resource "aws_security_group" "http" {
  name        = "${var.owner}-ssh-http"
  description = "Allow inbound traffic via http"
  vpc_id      = aws_vpc.vpc.id

  ingress = [
    {
      description      = "My public IP http"
      protocol         = var.sg_ingress_protocol
      from_port        = var.sg_ingress_http
      to_port          = var.sg_ingress_http
      cidr_blocks      = ["${chomp(data.http.myip.body)}/32"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false

  }]

  tags = {
    "Owner" = var.owner
    "Name"  = "${var.owner}-sg-http"
  }
}

resource "aws_security_group" "egress" {
  name        = "${var.owner}-allow-egress"
  description = "Allow all egress"
  vpc_id      = aws_vpc.vpc.id

  egress = [{
    description      = "All traffic"
    protocol         = var.sg_egress_proto
    from_port        = var.sg_egress_all
    to_port          = var.sg_egress_all
    cidr_blocks      = [var.sg_egress_cidr_block]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }]

  tags = {
    "Owner" = var.owner
    "Name"  = "${var.owner}-sg-egress"
  }
}
