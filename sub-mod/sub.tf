# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "vpclist" {

  /*filter {
    name   = "cidr-block"
    values = ["10.10.0.0/16"]
  }*/

  filter {
    name   = "tag:Name"
    values = ["NetServices"]
  }

  filter {
    name   = "isDefault"
    values = ["false"]
  }
}

output "aws_vpc" {
  value = "${data.aws_vpc.vpclist.id}"
}

# Now look up details for each subnet
/*
data "aws_vpc" "filtered_vpc" {
  count = "${length(aws_vpc.vpclist.ids)}"
 id    = "${data.aws_vpc.all.ids[count.index]}"
  filter {
    name   = "tag:owner"
    values = ["*NetOps*"]
  }
}
*/

# Create public subnets in the first available availability zone

resource "aws_subnet" "pub" {
  for_each                                    = var.mod-pubsub # Name - CDIR map
  cidr_block                                  = each.value
  vpc_id                                      = data.aws_vpc.vpclist.id
  map_public_ip_on_launch                     = true
  availability_zone                           = data.aws_availability_zones.available.names[0]
  enable_resource_name_dns_a_record_on_launch = true
  tags = {
    tier    = "Public"
    name    = each.key
    owner   = var.mod-tags["owner"]
    service = var.mod-tags["service"]
  }
}

# Create private subnets in the same available availability zone
resource "aws_subnet" "pri" {
  for_each                = var.mod-prisub # Name - CDIR map
  vpc_id                  = data.aws_vpc.vpclist.id
  cidr_block              = each.value
  map_public_ip_on_launch = false
  availability_zone       = data.aws_availability_zones.available.names[0]
  tags = {
    tier    = "Private"
    name    = each.key
    owner   = var.mod-tags["owner"]
    service = var.mod-tags["service"]
  }
}

