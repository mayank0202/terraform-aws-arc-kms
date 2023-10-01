output "key_arn" {
  value       = module.kms.key_arn
  description = "Key ARN"
}

output "key_id" {
  value       = module.kms.key_id
  description = "Key ID"
}

output "alias_arn" {
  value       = module.kms.alias_arn
  description = "Alias ARN"
}

output "alias_name" {
  value       = module.kms.alias_name
  description = "Alias name"
}
