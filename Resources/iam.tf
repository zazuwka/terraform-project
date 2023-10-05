# CREATE IAM
resource "aws_iam_user" "user" {
  name = "Aziz"
}
resource "aws_iam_user" "user1" {
  name = "Zhashar"
}
resource "aws_iam_group" "group" {
  name = "devops"
}
resource "aws_iam_group_membership" "team" {
  name = "tf-devops-group-membership"
  users = [
    aws_iam_user.user.name,
    aws_iam_user.user1.name,
  ]
  group = aws_iam_group.group.name
}