# Declare the data sources

data "aws_vpc" "vpclist" {

  filter {
    name   = "tag:Name"
    values = ["${var.mod-vpcname}"]
  }

}
