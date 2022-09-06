resource "aws_s3_bucket" "dashboards" {
  bucket = var.dashboards_bucket

  tags = {
    Name = "${var.prefix}-dashboards"
  }

  force_destroy = true
}