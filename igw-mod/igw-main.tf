resource "aws_internet_gateway" "igw" {
  vpc_id = data.aws_vpc.vpclist.id
  tags = {
    name    = "${var.mod-vpcname}-IGW"
    owner   = var.mod-tags["owner"]
    service = var.mod-tags["service"]
  }
}
