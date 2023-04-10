module "data-engineering" {
  source = "../../modules/iam_groups"
  name   = "data-engineering"
  users = [
    "data_engineer_1",
    "data_engineer_2",
    "data_engineer_3"
  ]
}
