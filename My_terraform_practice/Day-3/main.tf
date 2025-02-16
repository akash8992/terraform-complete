provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "akash" {
  ami           = "ami-00bb6a80f01f03502"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0980dbf395fd5df23"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "akash-s3-demo-aaa"
}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
