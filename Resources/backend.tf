terraform {
  backend "s3" {
    bucket = "terraform-project-aziz"
    key    = "bucket/terraform.tfstate"
    region = "us-east-2"
  }
}