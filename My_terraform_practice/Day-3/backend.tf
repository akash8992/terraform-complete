terraform {
  backend "s3" {
    bucket = "akash-s3-demo-aaa"
    region = "ap-south-1"
    key    = "akash/terraform.tfstate"
    #dynamodb_table = "terraform_lock"
  }
}
