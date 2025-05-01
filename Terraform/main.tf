data "aws_ami" "wordpress" {
  most_recent = true
  filter {
    name   = "name"
    values = ["wordpress*"]
  }
  owners = ["self"]
}

output "instance_public_ip" {
    value = aws_instance.group_2_instance.public_ip
}