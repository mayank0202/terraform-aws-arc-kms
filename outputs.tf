output "key_arn" {
  value       = join("", aws_kms_key.default[*].arn) # Use square brackets [*] here
  description = "Key ARN"
}

output "key_id" {
  value       = join("", aws_kms_key.default[*].key_id) # Use square brackets [*] here
  description = "Key ID"
}

output "alias_arn" {
  value       = join("", aws_kms_alias.default[*].arn) # Use square brackets [*] here
  description = "Alias ARN"
}

output "alias_name" {
  value       = join("", aws_kms_alias.default[*].name) # Use square brackets [*] here
  description = "Alias name"
}
