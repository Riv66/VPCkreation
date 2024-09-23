resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    name    = "${var.vpcname}-IGW"
    owner   = var.tags["owner"]
    service = var.tags["service"]
  }
}


output "IGW_Tags" {
  value = aws_internet_gateway.igw.tags_all
}

