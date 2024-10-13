output "NATServer_ip_addr" {
  value = aws_instance.nat_instance[count.index].public_ip
}
