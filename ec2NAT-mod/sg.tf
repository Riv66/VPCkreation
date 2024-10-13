# Security group for NAT Instances (allow inbound/outbound traffic)
resource "aws_security_group" "nat_sg" {
  vpc_id = data.aws_vpc.vpclist.id

  ingress {
    description = "Allow inbound SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow all inbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.mod-cdir}"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
tags = {
    name = "${var.mod-tags["owner"]}-nat-sg"
    owner   = var.mod-tags["owner"]
    service = var.mod-tags["service"]
 }
}

