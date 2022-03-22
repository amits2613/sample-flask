resource "aws_vpc" "practice" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name        = "${var.environment}-vpc"
  }
}


resource "aws_nat_gateway" "practice-nat" {
  allocation_id = aws_eip.elastic-ip.id
  subnet_id     = aws_subnet.practice-public.0.id

  tags = merge(
    {
      "Name" = "${var.environment}-nat"
    }
  )

  lifecycle {
    create_before_destroy = true
  }
}