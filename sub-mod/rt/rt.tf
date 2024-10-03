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

