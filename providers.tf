provider "aws" {
  region  = var.aws_region
}

terraform {
  required_version = "~>1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.27"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket                  = "bda-terraform-state-cf"
    region                  = "us-west-2"
    key                     = "terraform.tfstate"
    dynamodb_table          = "bda-terraform-state-cf"
    encrypt                 = true
  }

}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

# Configure the Cloudflare provider using the required_providers stanza
# required with Terraform 0.13 and beyond. You may optionally use version
# directive to prevent breaking changes occurring unannounced.
/*terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}*/

# terraform plan -var "cloudflare_api_token=..." -var "value_record=..." -var "dns_records=..."
