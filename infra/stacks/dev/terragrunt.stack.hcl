unit "lambda_code_bucket" {
  source = "${get_repo_root()}/infra/units/lambda-code-bucket"
  path   = "lambda-code-bucket"

  values = {
    bucket_name_prefix = "rx-refill-reminders-lambda-code"
  }
}
