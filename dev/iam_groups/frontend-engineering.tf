module "frontend-engineering" {
  source = "../../modules/iam_groups"
  name   = "frontend-engineering"
  users = [
    "developer_frontend_1",
    "developer_frontend_2",
    "developer_frontend_3"
  ]
}
