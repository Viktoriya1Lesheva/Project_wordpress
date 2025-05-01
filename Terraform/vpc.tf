resource "aws_vpc" "group_2" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "group-2"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.group_2.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.group_2.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-2"
  }
}

resource "aws_subnet" "public_subnet_3" {
  vpc_id     = aws_vpc.group_2.id
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-3"
  }
}

resource "aws_internet_gateway" "group_2_igw" {
  vpc_id = aws_vpc.group_2.id

  tags = {
    Name = "group-2-igw"
  }
}

resource "aws_route_table" "group_2" {
  vpc_id = aws_vpc.group_2.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.group_2_igw.id
  }
  tags = {
    Name = "group-2-rt"
  }
}

resource "aws_route_table_association" "public_subnet_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.group_2.id
}

resource "aws_route_table_association" "public_subnet_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.group_2.id
}

resource "aws_route_table_association" "public_subnet_3" {
  subnet_id      = aws_subnet.public_subnet_3.id
  route_table_id = aws_route_table.group_2.id
}