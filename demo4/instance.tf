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
