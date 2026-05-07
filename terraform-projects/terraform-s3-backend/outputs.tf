# output "s3_bucket_name" {
#   value = aws_s3_bucket.demoj.bucket
# }

# output "s3_bucket_id" {
#   value = aws_s3_bucket.demoj.id
# }

# output "s3_bucket_arn" {
#   value = aws_s3_bucket.demoj.arn
# }

output "tfstate_bucket_arn" {
  description = "ARN of the Terraform remote state S3 bucket"
  value       = aws_s3_bucket.tfstate_bucketj.arn
}

output "tfstate_bucket_id" {
  description = "Bucket ID (same as name) for Terraform state"
  value       = aws_s3_bucket.tfstate_bucketj.id
}