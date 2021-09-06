provider "aws" {
  access_key = "aa" //no-commit
  secret_key = "aa" //no-commit
  region     = var.aws_region
  #if you are running from AWS ec2 linux instance please use bellow credentials section
  #shared_credentials_file = "$HOME/.aws/credentials"
  #profile = "default"
}