
locals {
  # apply to every resource
  solo_tags = {
    Project     = "kpi-agent"
    Environment = "dev"
    Owner       = "Daniel"
    }
}