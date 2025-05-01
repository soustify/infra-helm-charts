resource "aws_s3_bucket" "default" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "default" {
  depends_on = [aws_s3_bucket.default]
  bucket = aws_s3_bucket.default.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "default" {
  depends_on = [aws_s3_bucket.default]
  bucket = aws_s3_bucket.default.id
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "default" {
  depends_on = [aws_s3_bucket.default]
  bucket = aws_s3_bucket.default.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_ownership_controls" "default" {
  depends_on = [aws_s3_bucket.default]
  bucket = aws_s3_bucket.default.id
  rule {
    object_ownership = "ObjectWriter"
  }
}
