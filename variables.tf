variable "github_token" {
  description = "Github Personal Access Token with Admin Access to Repo"
}

variable "repo_name" {
  description = "Name of the github repo"
  type        = string
}

variable "repo_description" {
  description = "Name of the github repo"
  type        = string
}

variable "repo_visibility" {
  description = "Name of the github repo"
  type        = string
}

variable "has_issues" {
  description = "Enable Github Issues"
  type        = bool
  default     = true
}

variable "has_wiki" {
  description = "Enable Github Wiki"
  type        = bool
  default     = true
}

variable "auto_init" {
  description = "Enable ReadME"
  type        = bool
  default     = true
}