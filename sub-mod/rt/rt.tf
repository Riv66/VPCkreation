# create pub rt
resource "aws_route_table" "pub-rt" {
  vpc_id = aws_vpc.vpclist.id
  tags = {
    tier    = "Private"
    name    = "${var.mod-vpcname}-pubRT"
    owner   = var.mod-tags["owner"]
    service = var.mod-tags["service"]
  }
}

#create priv rt
resource "aws_route_table" "pri-rt" {
  vpc_id = aws_vpc.vpclist.id
  tags = {
    tier    = "Private"
    name    = "${var.mod-vpcname}-priRT"
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
