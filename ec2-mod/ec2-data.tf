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
   #values = ["tag:NetOps1"]
   values = ["${var.mod-tags.value}"]
    }
}

data "aws_subnets" "prisublist" {

  filter {
    name   = "tag:tier"
   values = ["Private"]
    }

}

# Get most recent AMI
data "aws_ami" "amzn-linux-2023-ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}
