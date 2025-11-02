variable "aws_region" {
  default = "us-west-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  description = "Name of your existing AWS key pair"
  default     = "terraform-key"
}
