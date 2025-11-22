variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "devops-assignment-eks"
}

variable "cluster_version" {
  description = "Kubernetes version for the cluster (EKS version)"
  type        = string
  default     = "1.26"
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "Public subnets CIDRs (3 recommended)"
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "Private subnets CIDRs (3 recommended)"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "node_instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
  default     = "t3.medium"
}

variable "node_desired_capacity" {
  description = "Desired number of nodes in the managed node group"
  type        = number
  default     = 2
}

variable "node_min_size" {
  description = "Minimum size of node group"
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "Maximum size of node group"
  type        = number
  default     = 3
}
