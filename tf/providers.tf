terraform {
  required_version = ">= 1.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "jpcom-terraform"
    region         = "us-west-2"
    key            = "state/jpcom-website/terraform.tfstate"
    encrypt        = true
    dynamodb_table = "jpcom-tf-state-lock"
  }
}

provider "aws" {
  region  = "us-west-2"
}
