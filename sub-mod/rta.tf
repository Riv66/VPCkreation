
#Create rt association for public subnets
resource "aws_route_table_association" "rapub" {
for_each = aws_subnet.pub
  subnet_id      = each.value.id
    route_table_id = aws_route_table.pub-rt.id
  depends_on = [
    aws_subnet.pub
  ]
}

#Create rt association for pri subnet
resource "aws_route_table_association" "rapri" {
count = aws_subnet.pri
        subnet_id      = aws_subnet.pri[count.index].subnet_id
  route_table_id = aws_route_table.pri-rt.id
  depends_on = [
    aws_subnet.pri
  ]
}

