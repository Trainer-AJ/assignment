variable "aws_region" {
  default = "ap-south-1"
}

variable "environment" {
  default = "test"
}

variable "project_name" {
  default = "GitHub Actions"
}

variable "ecr_repositories" {
  description = "A set of repository names"
  type        = set(string)
  default     = ["employee-service-image", "user-service-image", "api-gw-image"]
}