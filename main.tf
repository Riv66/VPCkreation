#Create VPC

resource "aws_vpc" "vpc" {
  cidr_block = var.vpccdir
  tags = {
    name    = "${var.vpcname}"
    owner   = var.tags["owner"]
    service = var.tags["service"]
  }
}

output "VPC_ID" {
  value = aws_vpc.vpc.id
}

output "VPC_Tags" {
  value = aws_vpc.vpc.tags_all
}