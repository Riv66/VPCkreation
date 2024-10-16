
#Create rt association for public subnets using for_each
resource "aws_route_table_association" "rapub" {
count = var.mod-public_subnet_count * var.mod-az_count
  subnet_id      = aws_subnet.pub[count.index].id 
    route_table_id = aws_route_table.pub-rt.id
  depends_on = [
    aws_subnet.pub
  ]
}

#Create rt association for pri subnet using count 
resource "aws_route_table_association" "rapri" {
count = var.mod-private_subnet_count * var.mod-az_count
         subnet_id     = aws_subnet.pri[count.index].id  
  route_table_id = aws_route_table.pri-rt.id
  depends_on = [
    aws_subnet.pri
  ]
}

