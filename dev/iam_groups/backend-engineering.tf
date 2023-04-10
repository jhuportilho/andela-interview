module "backend-engineering" {
  source = "../../modules/iam_groups"
  name   = "backend-engineering"
  users = [
    "developer_backend_1",
    "developer_backend_2",
    "developer_backend_3"
  ]
}
