# create instance
resource "aws_vpc_ipam" "example" {
  description          = "${var.mod-vpcname}-IPAM"
  operating_regions = [
    {
      region_name = "us-east-1"
    },
    {
      region_name = "us-west-2"
    }
  ]
 tags = {
    name    = "${var.mod-vpcname}-IPAM"
    owner   = var.mod-tags["owner"]
    service = var.mod-tags["service"]
  }
  }

#create pool
resource "aws_vpc_ipam_pool" "example" {
  ipam_scope_id      = aws_vpc_ipam.example.private_default_scope_id
  address_family     = "ipv4"
  locale             = "us-west-2"
  allocation_default_netmask_length = 24
 tags = {
    name    = "${var.mod-vpcname}-IPAM-pool"
    owner   = var.mod-tags["owner"]
    service = var.mod-tags["service"]
 }
