#Create Web Server AMI
resource "aws_ami_from_instance" "example" {
 # name               = "MyPrivateWebServerAmi"
 name = "${var.mod-tags["owner"]}-WebserverAMI"
  source_instance_id = aws_instance.webserver.id
     tags = {
    tier    = "Public"
    owner   = var.mod-tags["owner"]
    service = var.mod-tags["service"]
 }
  
  depends_on = [
    aws_instance.webserver
  ]
}
