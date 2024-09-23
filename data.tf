data "aws_subnets" "pubsublist" {

  filter {
    name   = "tag:tier"
   values = ["Public"]
    }

}

output "PublicSubList" {
#value = data.aws_subnets.pubsublist.ids # replacd with below for output info
  value = length(data.aws_subnets.pubsublist.ids) > 0 ? data.aws_subnets.pubsublist.ids :[ "No subnets created", "to list yet!"] # because IDs is more than one string
}


data "aws_subnets" "prisublist" {

  filter {
    name   = "tag:tier"
   values = ["Private"]
    }

}

output "PrivateSubList" {
#value = data.aws_subnets.prisublist.ids
# provide message when list initially empty 
value = length(data.aws_subnets.prisublist.ids) > 0 ? data.aws_subnets.prisublist.ids :[ "No subnets created", "to list yet!"] # IDs is list of strings
}
