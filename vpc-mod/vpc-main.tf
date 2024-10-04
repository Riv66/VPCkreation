resource "aws_vpc" "vpc" {
  cidr_block = var.mod-cdir
 
 tags = {
    name    = "${var.mod-vpcname}"
    owner   = var.mod-tags["owner"]
    service = var.mod-tags["service"]
  }
}
