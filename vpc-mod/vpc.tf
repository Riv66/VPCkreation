resource "aws_vpc" "vpc" {
  cidr_block = var.mod-cdir
 
  # test alt
   Name =  "${var.mod-vpcname}"
   tags = var.mod_tags
   
   /*tags = {
    name    = "${var.mod-vpcname}"
    owner   = "NetOps1"
    service = "Networking"
  }*/
}

output "VPC_ID" {
  value = aws_vpc.vpc.id
}

output "VPC_Tags" {
  value = aws_vpc.vpc.tags_all
}
