provider "aws" {
  region = "ap-south-1"
}

# Create IAM User
resource "aws_iam_user" "admin_user" {
  name = "superadmin"
}

# Attach Full Administrator Access to the User
resource "aws_iam_user_policy_attachment" "admin_policy" {
  user       = aws_iam_user.admin_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# Create a Billing Admin Group
resource "aws_iam_group" "billing_admin" {
  name = "BillingAdmins"
}

# Attach Billing Permissions to the Group
resource "aws_iam_group_policy_attachment" "billing_access" {
  group      = aws_iam_group.billing_admin.name
  policy_arn = "arn:aws:iam::aws:policy/job-function/Billing"
}

# Add the user to the Billing Admin Group
resource "aws_iam_group_membership" "billing_membership" {
  name  = "billing_membership"
  users = [aws_iam_user.admin_user.name]
  group = aws_iam_group.billing_admin.name
}
