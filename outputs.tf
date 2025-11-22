output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_id
}

output "region" {
  description = "AWS region used"
  value       = var.region
}

output "kubeconfig_command" {
  description = "Command to generate kubeconfig locally (run where you have aws cli configured)"
  value       = "aws eks update-kubeconfig --name ${module.eks.cluster_id} --region ${var.region}"
}

output "cluster_endpoint_hint" {
  description = "You can find the cluster endpoint in the AWS Console -> EKS -> cluster, or run the update-kubeconfig command above"
  value       = module.eks.cluster_endpoint
}

output "node_group_role_names" {
  description = "Node group IAM role names"
  value       = module.eks.node_groups[*].iam_role_name
  # note: depending on module version and shape, this returns role names; if not available adjust after you run terraform apply
}
