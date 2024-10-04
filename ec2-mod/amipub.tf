#Create Web Server AMI
resource "aws_ami_from_instance" "example" {
 # name               = "MyPrivateWebServerAmi"
  source_instance_id = aws_instance.webserver.id
     tags = {
    tier    = "Public"
    name = "${var.tags["owner"]}-WebserverAMI"
    owner   = var.tags["owner"]
    service = var.tags["service"]
 }
  
  depends_on = [
    aws_instance.webserver
  ]
}
