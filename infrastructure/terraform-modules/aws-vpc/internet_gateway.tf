resource "aws_internet_gateway" "practice-ig" {
  vpc_id = aws_vpc.practice.id

  tags = {
    Name = "${var.environment}-ig"
  }
}