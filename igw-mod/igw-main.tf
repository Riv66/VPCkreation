resource "aws_internet_gateway" "igw" {
  vpc_id = data.aws_vpc.vpclist.id
  tags = {
    name    = "${var.mod-vpcname}-IGW"
    owner   = var.mod-tags["owner"]
    service = var.mod-tags["service"]
  }
}


#add default route to igw 
resource "aws_route" "rtIGW" {
  route_table_id         = aws_route_table.pub-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id

}