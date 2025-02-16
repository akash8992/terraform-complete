terraform {
  backend "s3" {
    bucket         = "akash-s3-demo-xyz" # change this
    key            = "abhi/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
