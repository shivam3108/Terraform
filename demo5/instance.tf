resource "aws_key_pair" "logginkey" {
  key_name   = "mykey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "example"{
ami = var.AMIS[var.AWS_REGION]
instance_type = "t2.micro"
 # the VPC subnet
  subnet_id = aws_subnet.main.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]


key_name      = aws_key_pair.logginkey.key_name
}

resource "aws_ebs_volume" "example" {
  availability_zone = "ap-south-1a"
  size              = 40

  tags = {
    Name = "HelloWorld"
  }
}
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.example.id
}
