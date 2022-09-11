resource "aws_s3_bucket" "dashboards" {
  bucket = var.dashboards_bucket

  tags = {
    Name = "${var.prefix}-dashboards"
  }

  force_destroy = true
}

resource aws_s3_bucket_website_configuration "www" {
  bucket = aws_s3_bucket.dashboards.id

  index_document {
    suffix = "dashboards.zip"
  }
}

resource "aws_s3_object" "dashboards" {
  bucket = aws_s3_bucket.dashboards.id
  key    = "dashboards.zip"
  acl    = "public-read"
  source = var.dashboards_zip
  etag = filemd5(var.dashboards_zip)
}