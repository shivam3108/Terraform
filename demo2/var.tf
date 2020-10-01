variable "AWS_ACCESS_KEY" {
type = string
}
variable "AWS_SECRET_KEY" {
type = string
}
variable "AWS_REGION"{
type = string
default= "ap-south-1"
}
variable "AMIS" {
  type = map(string)
  default = {
    ap-south-1 = "ami-0cda377a1b884a1bc"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-0d729a60"
  }
}
