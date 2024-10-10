# Declare the data sources
data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "vpclist" {
  filter {
    name   = "cidr-block"
    values = ["${var.mod-cdir}"]
  }

/*
# other options to test 
  filter {
    name   = "tag:Name"
    values = ["${var.mod-vpcname}"]
  }

  # filter tested ok as option
 filter {
    name   = "isDefault"
    values = ["false"]
  }
*/
}

