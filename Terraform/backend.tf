terraform {
  backend "s3" {
    bucket = "shivam-terraform-statefile"
    key = "server_name/statefile"
    region = "ap-south-1"
  }
}  
