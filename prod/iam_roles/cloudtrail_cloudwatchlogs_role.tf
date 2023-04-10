module "cloudtrail_cloudwatchlogs" {
  source           = "../../modules/iam_role"
  role_name        = "cloudtrail_cloudwatchlogs"
  role_description = "cloudtrail_cloudwatchlogs"
  policies = [
    data.terraform_remote_state.terraform_remote_state_iam_policy.outputs.cloudtrail_cloudwatchlogs-arn,
  ]
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudtrail.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

output "cloudtrail_cloudwatchlogs-role-arn" {
  value = module.cloudtrail_cloudwatchlogs.role-arn
}
