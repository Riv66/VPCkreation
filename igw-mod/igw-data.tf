# Declare the data sources

data "aws_vpc" "vpclist" {

  filter {
    name   = "tag:Name"
    values = ["${var.mod-vpcname}"]
  }
}

data "aws_route_table" "rtlist" {

  filter {
    name   = "tag:tier"
    values = ["Public"]
  }
}
