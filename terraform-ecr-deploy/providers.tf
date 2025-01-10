terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


terraform {
  backend "s3" {
    bucket = "assignment-dev-env-tfstate"
    key    = "test/ecr.tfstate"
    region = "ap-south-1"
    # use_lockfile = true
    dynamodb_table = "TF-state-locking"
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = var.environment
      Project     = var.project_name
      ManagedBy   = "Terraform"
    }
  }
}
