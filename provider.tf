variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "Optional AWS CLI profile name (leave blank to use default credentials)"
  type        = string
  default     = ""
}

provider "aws" {
  region = var.region

  # Optional profile usage
  # If empty string, Terraform will fall back to default credential chain.
  alias   = "default"
  shared_credentials_files = var.aws_profile == "" ? null : [pathexpand("~/.aws/credentials")]
}

# helper function pathexpand is not available in plain tf; ignore if using profile
# If you use a profile, run terraform with AWS_PROFILE env var or configure provider accordingly:
#   export AWS_PROFILE=your-profile
