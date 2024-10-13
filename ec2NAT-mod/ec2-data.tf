data "aws_vpc" "vpclist" {

# to test input to filter
  filter {
    name   = "cidr-block"
    values = ["${var.mod-cdir}"]
  }
}

  data "aws_subnets" "pubsublist" {
  filter {
    name   = "tag:tier"
   values = ["Public"]
    }

 filter {
    name   = "tag:owner"
      values = ["${var.mod-tags["owner"]}"]
    }
}

data "aws_subnets" "prisublist" {

  filter {
    name   = "tag:tier"
   values = ["Private"]
    }

}

# Get most recent NAT AMI
data "aws_ami" "nat-ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-vpc-nat-*-x86_64"]
  }
}
