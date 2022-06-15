resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.internal.id

  tags = {
    Name = "igw"
  }
}
