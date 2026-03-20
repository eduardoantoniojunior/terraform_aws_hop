terraform {
  backend "s3" {
    bucket = "bucket-ejunior-terraform"
    key    = "opensourcedata/dev/app/hop/terraform.tfstate"
    region = "us-east-1"
  }
}