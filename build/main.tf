terraform {
  backend "s3" {
    bucket         = "herrschade-terraform-tf-state"
    key            = "terraform-aws-react/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }
}


module "web_app" {
  source = "./modules/webapp"

  domain = "oskardragon.click"
}
