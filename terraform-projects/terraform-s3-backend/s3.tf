# resource "aws_s3_bucket" "demoj" {
#   bucket = "jenil-test-${random_string.suffix.result}"

#   tags = {
#     Owner       = "jenil"
#     Department  = "PES"
#     ProjectName = "EIC Internal"
#     EndDate     = "EOD"
#     BU          = "IA"
#     Env         = "Dev"
#   }
# }

resource "aws_s3_bucket" "tfstate_bucketj" {
  bucket = "tfstatej-${var.environment_name}-${var.aws_region}-${random_string.suffix.result}"
  lifecycle {
    prevent_destroy = false
  }
  tags = var.tags
}

resource "aws_s3_bucket_versioning" "tfstate_versioningj" {
  bucket = aws_s3_bucket.tfstate_bucketj.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tfstate_encryptionj" {
  bucket = aws_s3_bucket.tfstate_bucketj.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "tfstate_block_publicj" {
  bucket                  = aws_s3_bucket.tfstate_bucketj.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}