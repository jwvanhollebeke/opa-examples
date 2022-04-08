resource "aws_s3_bucket" "test" {
  bucket = "joelvh-test-bucket"

  tags = {
    "required-tag" = "joelvh"
  }
}

resource "aws_s3_bucket" "no_tags" {
  bucket = "joelvh-no-tags-bucket"
}
