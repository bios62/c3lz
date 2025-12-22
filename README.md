# c3lz — Landing Zone (OCI)

Purpose
-
This folder contains the c3lz landing zone Terraform configuration for Oracle Cloud Infrastructure (OCI). It provides opinionated, small-scale landing zone components used for testing and reference deployments (IAM, compartments, policies and storage resources).

Project layout
-
- `landingzone/common/` — common provider and variable definitions used by the landing zone.
- `landingzone/iam/` — identity resources: groups, compartments, domain configuration and related IAM constructs.
- `landingzone/storage/` — Object Storage and storage-related resources and data sources.
- `landingzone/policy/` — example policies and policy attachments for the landing zone.
- `landingzone/files/setenv` — environment file to `source` before running Terraform (set `TF_VAR_...` variables and credentials).

Prerequisites
-
- Terraform 1.x
- OCI CLI/API credentials (API key, fingerprint, private key). See `landingzone/files/setenv` and populate it with your OCIDs and key path.
- Ensure the OCI provider version in `provider.tf` matches your Terraform version (check `.terraform.lock.hcl`).

Quick start
-
1. Open a shell and source the environment file (edit it first and add values):

```bash
source landingzone/files/setenv
```

2. Change to the module you want to deploy, initialize and plan:

```bash
cd landingzone/common
terraform init
terraform plan
```

3. Apply the plan when ready:

```bash
terraform apply
```

Notes and recommendations
-
- Do not commit secrets or real private keys. Keep `landingzone/files/setenv` local or use `files/setenv.local` for overrides.
- For team use, configure a remote backend (OCI Object Storage) instead of local state.
- The landing zone examples are intentionally small — adapt compartment structure, tagging and policies to match your organisation standards before production use.

Extending the landing zone
-
- Add modules under `landingzone/` (e.g., networking, logging, security) and reference them from a top-level orchestration root module.
- Consider adding automated validation (pre-flight checks) and a CI workflow for `terraform fmt`, `terraform validate` and `terraform plan`.

Support
-
If you need help tailoring this landing zone, tell me which resources (networking, audit / logging, governance) you want added and I can scaffold the modules.
