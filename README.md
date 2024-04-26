# Python Project Boilerplate

The goal of this repo is to provide an (opinionated) starting point for a self contained (Dockerized) python project.

---
### Notes & Highlights
- The project is setup via **pyproject.toml**.
- Common quick-actions are available via a **Makefile**.
- An efficient [~165Mb] **Dockerfile** is provided.

---
### Dependencies
- Dependencies are managed via **Poetry** which is recommended but not nessesary. *requirements.txt* files are also available.
- Apart for "regular" dependencies, there are also a "dev" and "test" requirements groups, allowing for granular managment.
- Currently, the only "regular" dependency is **python-dotenv** which allows reading *.env* files (more will be added in the future)
- Dev dependencies used:
  - **Ruff** formatter & linter.
  - **mypy** a static type checker.
  - **pre-commit** a tool to force code quality on every commit (not pre-configured yet).
- Test dependencies used:
  - Pytest (plugins and tox to be added in the future)

---
### Roadmap / TODO 
- In progress:
  - Accompanying package
  - Add pre-commit configuration
  - Add GitHub actions CI/CD boilerplate
  - Consider variants (requires a git modular approach - sub-modules? varients as branches?)
- Future work:
  - more makefile actions  
  - Variants: - FastAPI (with routes tooling), Model serving on GPU machines (which?)
  - Consider using a monorepo -> bazel ?
  - Tox testing boilerplate
- Distant Future:
  - Consider replacing Poetry (with what? pipx / pixi / uv)

---
### Accompanying package content
- Must have:
  - Config managment (Dynaconf? Hydra?)
  - Logging (stdout, stderr, rotating file, cloud sink?)
- High priority:
  - Rabbit client
- Medium priority
  - Redis / Vakley client
  - Postgres / SQLModel / Pydantic tooling
- Low priority:
  - Kafka clients
  - Elastic / Mongo clients
