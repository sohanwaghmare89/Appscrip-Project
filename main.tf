locals {
  cluster_name = var.cluster_name
}

# Use the widely used EKS module to create VPC + EKS quickly.
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.0"

  cluster_name    = local.cluster_name
  cluster_version = var.cluster_version
  subnets         = concat(var.public_subnets, var.private_subnets) # not strictly required when create_vpc = true

  # Create VPC and subnets for you (simple layout).
  create_vpc = true
  vpc_cidr   = var.vpc_cidr

  public_subnet_cidrs  = var.public_subnets
  private_subnet_cidrs = var.private_subnets

  # Basic node group (managed)
  manage_aws_auth = true

  node_groups = {
    default_nodes = {
      desired_capacity = var.node_desired_capacity
      min_capacity     = var.node_min_size
      max_capacity     = var.node_max_size

      instance_types = [var.node_instance_type]

      # Use the default AMI for the region (managed node group)
      # You can set disk_size, key_name etc. if required
    }
  }

  # Optional — enable basic cluster logging
  cluster_enabled_log_types = ["api", "audit", "authenticator"]

  tags = {
    Project = "devops-assignment"
    Owner   = "student"
  }
}

# (Optional) Create kubeconfig file on the machine where terraform runs.
# NOTE: terraform should not manage local files on remote EC2 without extra work; instead we output a command below.
