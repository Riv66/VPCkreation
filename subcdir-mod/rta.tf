
#Create rt association for public subnets using for_each
resource "aws_route_table_association" "rapub" {
#count = var.mod-public_subnet_count * var.mod-az_count
 # subnet_id      = aws_subnet.pub[count.index].id 
  for_each = aws_subnet.pub[each.key]
  subnet_id = each.value.id
    route_table_id = aws_route_table.pub-rt.id
  depends_on = [
    aws_subnet.pub
  ]
}

#Create rt association for pri subnet using count 
resource "aws_route_table_association" "rapri" {
#count = var.mod-private_subnet_count * var.mod-az_count
 #        subnet_id     = aws_subnet.pri[count.index].id  
   for_each = aws_subnet.pri[each.key]
  subnet_id = each.value.subnet_id
    route_table_id = aws_route_table.pri-rt.id
  depends_on = [
    aws_subnet.pri
  ]
}

