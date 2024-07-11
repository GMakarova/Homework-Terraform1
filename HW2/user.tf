resource "aws_iam_user" "lb" {
  for_each = toset(["kaizen1","kaizen2"])
  name = each.key
}