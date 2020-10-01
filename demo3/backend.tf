terraform {
  backend "s3" {
    bucket = "remote-state-terraform-aws"
    key    = "Terraform/demo3"
    region = "ap-south-1"
  }
}
