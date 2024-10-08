# Declare the data sources
data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "vpclist" {

# to test input to filter
  filter {
    name   = "cidr-block"
    values = ["${var.mod-cdir}"]
  }

/*
# to test filter
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

