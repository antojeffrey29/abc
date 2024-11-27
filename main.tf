terraform {
  backend "s3" {
    bucket         = "tfstatebuc"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
  /*required_version = ">=0.13.0"
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source = "hashicorp/aws"
    }
  }*/
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}