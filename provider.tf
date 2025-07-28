terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.4.0"
    }
  }
}

provider "aws" {
    region ="eu-central-1"
    shared_credentials_files = ["C:\\Users\\hkarvir\\.aws\\credentials"]
    profile = "Administrator"
}