output "vpc_attributes" {
    value = aws_vpc.practice
}

output "private_subnet_id" {
    value = aws_subnet.practice-private.*.id
}