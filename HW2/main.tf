provider aws {
    region = "us-east-2"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

# resource "aws_s3_bucket" "example" {
#   bucket = "kaizen-galina"
#   force_destroy = true
# }

resource "aws_s3_object" "object" {
  depends_on = [aws_s3_bucket.example]
  bucket = "kaizen-galina"
  key    = "main.tf"
  source = "main.tf"
}

resource "aws_s3_bucket" "example" {
  bucket_prefix = "kaizen-"
  force_destroy = true
}

resource "aws_s3_bucket" "examples" {
  bucket_prefix = "bucket-created-manually"
  force_destroy = true
}