resource "aws_ecr_repository" "pvt_repo" {
  for_each             = toset(var.ecr_repositories)
  name                 = each.key
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}

output "ecr_uris" {
  value = { for repo, ecr in aws_ecr_repository.pvt_repo : repo => ecr.repository_url }
}