variable "instance_type" {
  description = "EC2 instance type"  
  type = string
  default = "t3.micro"
}

variable "key_name" {
  description = "Key pair used to access"  
  type = string
  default = "descomplicando_packer"
}