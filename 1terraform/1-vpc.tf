resource "aws_vpc" "internal" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "internal"
  }
}
