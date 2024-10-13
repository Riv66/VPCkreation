output "NATServer_ip_addr" {
  value = aws_instance.nat_sg.public_ip
}
