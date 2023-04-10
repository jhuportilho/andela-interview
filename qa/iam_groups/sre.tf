module "sre" {
  source = "../../modules/iam_groups"
  name   = "sre"
  users = [
    "rogeria_sre_1",
    "user_sre_2",
    "user_sre_3"
  ]
}
