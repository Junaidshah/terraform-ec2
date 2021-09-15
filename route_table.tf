resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.rt_cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    "Owner" = var.owner
    "Name"  = "${var.owner}-route_table"
  }

}

resource "aws_route_table_association" "route_table_subnet_associations" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.route_table.id
}