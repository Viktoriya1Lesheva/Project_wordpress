resource "aws_instance" "group_2_instance" {
  ami                         = data.aws_ami.wordpress.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet_1.id
  vpc_security_group_ids      = [aws_security_group.group_2_sg.id]
  associate_public_ip_address = true
  tags = {
    Name = "group-2-instance"
  }
}