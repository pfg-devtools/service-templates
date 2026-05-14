# service-templates

Golden-path scaffolds for new services. Copy a template, replace
`{{SERVICE}}`, and point CI at
[`pfg-devtools/actions`](https://github.com/pfg-devtools/actions).

Protect `main` with
[`pfg-devtools/tf-github`](https://github.com/pfg-devtools/tf-github)
once the repo exists. Run
[`pre-commit-hooks`](https://github.com/pfg-devtools/pre-commit-hooks)
locally.

## Templates

| Path | Stack | Includes |
|------|--------|----------|
| [`templates/go-service`](templates/go-service) | Go 1.23 HTTP | `cmd/server`, `/healthz`, distroless Dockerfile, GHA |
| [`templates/python-service`](templates/python-service) | Python 3.12 FastAPI | `src/app`, uvicorn, slim Dockerfile, GHA |
| [`templates/terraform-module`](templates/terraform-module) | Terraform >= 1.6 | `variables` / `outputs` / `versions`, `examples/basic` |

Every HTTP template exposes `GET /healthz`. Runtime images are distroless
or slim. Templates contain **no secrets**.

## Create a repo from a template

```bash
./scripts/new-service.sh go-service ../my-service
# or: python-service | terraform-module
cd ../my-service
# replace {{SERVICE}} in files and go.mod / pyproject name
git init -b main
```

`scripts/new-service.sh` copies the template tree as-is. It does not talk
to GitHub; create the remote yourself or via `tf-github`.

## Layout

```
templates/go-service/
  cmd/server/main.go
  internal/health/
  Dockerfile
  .github/workflows/ci.yml
templates/python-service/
  src/app/main.py
  pyproject.toml
  Dockerfile
templates/terraform-module/
  main.tf variables.tf outputs.tf versions.tf
  examples/basic/
scripts/new-service.sh
docs/using.md
docs/conventions.md
```

## Conventions

- `/healthz` on every HTTP service
- CI uses `pfg-devtools/actions` composites, not vendored setup steps
- Do not add application business logic to a template

Full walkthrough: [docs/using.md](docs/using.md).
Style: [docs/conventions.md](docs/conventions.md).

## Contributing

PRs against `main`. `make check` must pass. See
[CONTRIBUTING.md](CONTRIBUTING.md). Secrets:
[SECURITY.md](SECURITY.md).
