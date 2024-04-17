# Python Project Boilerplate

The goal of this repo is to provide an (opinionated) starting point for a self contained (Dockerized) python project.

### Some highlights
---
- The project is setup via **pyproject.toml**.
- Quick actions are available via a **Makefile**.
- An efficient [~165Mb] **Dockerfile** is provided.

### Dependencies
---
- Dependencies are managed via **Poetry** which is recommended but not nessesary. a *requirements.txt* files are also available.
- Apart for "regular" dependencies, there is also a "dev" group and "test" group, allowing for granular managment.
- the only "regular" dependency is **python-dotenv** which allows reading *.env* files
- Dev dependencies used:
  - **Ruff** formatter & linter.
  - **mypy** a static type checker.
  - **pre-commit** a tool to force code quality on every commit.

### Roadmap
---
- Add pre-commit configuration
- Add GitHub actions boilerplate
- Consider using *uv* and/or *rye* [Distant Future]