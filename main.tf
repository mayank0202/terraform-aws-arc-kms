provider "aws" {
  region = var.region
}


module "tags" {
  source  = "sourcefuse/arc-tags/aws"
  version = "1.2.3"

  environment = var.environment
  project     = var.namespace

  extra_tags = {
    MonoRepo     = "True"
    MonoRepoPath = "terraform/kms"
  }
}

resource "aws_kms_key" "default" {
  count                    = var.enabled ? 1 : 0
  deletion_window_in_days  = var.deletion_window_in_days
  enable_key_rotation      = var.enable_key_rotation
  policy                   = var.policy
  tags                     = var.tags
  description              = var.description
  key_usage                = var.key_usage
  customer_master_key_spec = var.customer_master_key_spec
  multi_region             = var.multi_region
}

resource "aws_kms_alias" "default" {
  count         = var.enabled ? 1 : 0
  name          = coalesce(var.alias, format("alias/%v", module.tags.tags))
  target_key_id = join("", aws_kms_key.default[*].id)
}
