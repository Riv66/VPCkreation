resource "aws_vpc" "vpc" {
  cidr_block = var.mod-cdir
  tags = {
    name    = "${var.mod-vpcname}"
    owner   = "NetOps1"
    service = "Networking"
  }
}
