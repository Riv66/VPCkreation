output "VPC_ID" {
  value = aws_vpc.vpc.id
}

output "VPC_Tags" {
  value = aws_vpc.vpc.tags_all
}
