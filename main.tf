terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}


resource "github_repository" "repo_creater" {
  name        = var.repo_name
  description = var.repo_description
  visibility  = var.repo_visibility
  has_issues  = var.has_issues
  auto_init   = var.auto_init
  topics      = ["terraform", "automation", "test-setup"]
}