output "NATServer_ip_addr" {
  value = aws_instance.nat_instance.public_ip
}
