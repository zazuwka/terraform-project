#CREATE VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
#CREATE SUBNETS
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
}
resource "aws_subnet" "main1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
}
resource "aws_subnet" "main2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"
}
#CREATE INTERNET GATEWAY
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}
#CREATE ROUTE TABLE AND ASSOCIATION
resource "aws_route_table" "r" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.r.id
}
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.main1.id
  route_table_id = aws_route_table.r.id
}
resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.main2.id
  route_table_id = aws_route_table.r.id
}