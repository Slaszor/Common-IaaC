locals {
  tfstate-bucket-name = "${var.default-prefix}-tfstate-${var.environment}"
}

resource "aws_s3_bucket" "tfstate" {
  bucket = local.tfstate-bucket-name

  tags = {
    Name   = local.tfstate-bucket-name
  }
}

resource "aws_s3_bucket_acl" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id

  versioning_configuration {
    status = "Enabled"
  }
}