output "user_name" {
  value       = local.username
  description = "Normalized IAM user name"
}

output "user_arn" {
  value       = join("", aws_iam_user.default.*.arn)
  description = "The ARN assigned by AWS for this user"
}

output "user_unique_id" {
  value       = join("", aws_iam_user.default.*.unique_id)
  description = "The unique ID assigned by AWS"
}

output "access_key_id" {
  value       = join("", local.access_key.*.id)
  description = "The access key ID"
}

output "secret_access_key" {
  sensitive   = true
  value       = join("", local.access_key.*.secret)
  description = "The secret access key. This will be written to the state file in plain-text"
}

output "ses_smtp_password_v4" {
  sensitive   = true
  value       = join("", compact(local.access_key.*.ses_smtp_password_v4))
  description = "The secret access key converted into an SES SMTP password by applying AWS's Sigv4 conversion algorithm"
}
