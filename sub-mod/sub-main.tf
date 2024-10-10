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

# Create private subnets based on the number of private subnets and AZs
resource "aws_subnet" "pri" {
  count = var.mod-private_subnet_count
 vpc_id                  = data.aws_vpc.vpclist.id
  cidr_block        = cidrsubnet(data.aws_vpc.vpclist.cidr_block, 8, count.index + var.mod-public_subnet_count)  # Shift CIDR for private subnets
  availability_zone = data.aws_availability_zones.available.names[count.index % var.mod-az_count]

  tags = {
    tier    = "Private"
    name = "${var.mod-vpcname}-Pri_Sub-${count.index + 1}"
     owner   = var.mod-tags["owner"]
    service = var.mod-tags["service"]
  }
}

/*
resource "aws_subnet" "pri" {
  #for_each                = var.mod-prisub # map
  count = var.mod-azs
  vpc_id                  = data.aws_vpc.vpclist.id
  #cidr_block              = each.value
  # allocate subnet from cdir block, with adiitional 8 bit mask, from 0
  #cidr_block = cidrsubnet(data.aws_vpc.vpclist.cidr_block, 8, (index(keys(var.mod-prisub), each.key))) #converts string value to index numerical value from 0
  cidr_block = cidrsubnet(data.aws_vpc.vpclist.cidr_block, 8, count.index)
  map_public_ip_on_launch = false
 # availability_zone       = data.aws_availability_zones.available.names[0]
  availability_zone = "${var.mod-region}${element(["a", "b"], count.index % 2)}"
  tags = {
    tier    = "Private"
    name    = "${var.mod-vpcname}-Pri_Sub-${count.index}"
   #name    = each.key
    owner   = var.mod-tags["owner"]
    service = var.mod-tags["service"]
  }
}
*/
