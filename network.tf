# Creates a VPC with 2 subnets for Client VPN subnet and Application subnet.
resource "aws_vpc" "vpn-vpc" {
  cidr_block = "10.10.0.0/23"
}

resource "aws_subnet" "vpn-subnet" {
  vpc_id            = aws_vpc.vpn-vpc.id
  availability_zone = "ap-south-1a"
  cidr_block        = var.vpn_CIDR
}

resource "aws_subnet" "app-subnet" {
  vpc_id            = aws_vpc.vpn-vpc.id
  availability_zone = "ap-south-1a"
  cidr_block        = var.app_CIDR
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpn-vpc.id

  tags = {
    Name = "private"
  }
}

resource "aws_route_table_association" "vpn-subnet" {
  subnet_id      = aws_subnet.vpn-subnet.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "app-subnet" {
  subnet_id      = aws_subnet.app-subnet.id
  route_table_id = aws_route_table.private.id
}