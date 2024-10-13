# Create NAT Instances in Public Subnets
resource "aws_instance" "nat_instance" {
  count = var.mod-az_count

  ami                         = data.aws_ami.nat-ami.id
  instance_type               = "t2.micro"
  subnet_id                   = data.aws_subnets.pubsublist.id
  key_name                    = var.mod-keyp
  associate_public_ip_address = true
  source_dest_check            = false # Disable source/destination check for NAT

  vpc_security_group_ids = [aws_security_group.nat_sg.id]

  tags = {
    name = "${var.mod-tags["owner"]}-nat-instance-${count.index + 1}"
    owner   = var.mod-tags["owner"]
    service = var.mod-tags["service"]
  }
}

