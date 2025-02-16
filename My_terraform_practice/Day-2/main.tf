provider "aws" {
  region = "ap-south-1"
}

module "ec2_instance" {
  source              = "./modules/ec2_instance"
  ami_value           = "ami-00bb6a80f01f03502"
  instance_type_value = "t2.micro" # Corrected instance type
  subnet_id_value     = "subnet-0980dbf395fd5df23"
}
