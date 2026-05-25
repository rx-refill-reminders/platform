# stacks

Terragrunt stacks (`dev`, `prd`). Each stack directory contains only:

| File | Purpose |
|------|---------|
| `stack.yml` | AWS account, assume-role ARN, S3 state bucket |
| `terragrunt.stack.hcl` | Blueprint — generates all units on demand |

Units are generated under `.terragrunt-stack/` (gitignored). Do not add per-unit folders under `prd/` or `dev/`.

Shared backend config: [`root.hcl`](root.hcl) reads `stack.yml` (`use_lockfile = true`). Requires **Terraform >= 1.10**.

## Commands

```bash
cd infra/stacks/prd
terragrunt stack run plan    # generate + plan
terragrunt stack run apply
```

State keys: `prd/.terragrunt-stack/lambda-code-bucket/terraform.tfstate` (relative to `root.hcl`).

## Adding a unit

1. Add a template under [`../units/<name>/terragrunt.hcl`](../units/).
2. Add a `unit` block to each env’s `terragrunt.stack.hcl`.

Unit templates: [`../units/lambda-code-bucket/terragrunt.hcl`](../units/lambda-code-bucket/terragrunt.hcl).
