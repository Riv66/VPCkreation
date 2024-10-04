resource "aws_instance" "webserver" {
  ami           = data.aws_ami.amzn-linux-2023-ami.id
  instance_type = "t2.micro"
  subnet_id = data.aws_subnets.pubsublist.ids[1]
  key_name               = var.keyp
  vpc_security_group_ids = ["${aws_security_group.pubSG.id}"]
  user_data              = <<-EOF
#!/bin/bash 
sudo su
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "<html><h1> Welcome to NetOps PrivateLink Server </h1></html>" >> /var/www/html/index.html       
EOF 
  tags = {
    tier    = "Public"
    name = "${var.tags["owner"]}-Webserver"
    owner   = var.tags["owner"]
    service = var.tags["service"]
 }
}
