.PHONY: git_clean poetry_export_all poetry_export poetry_export_dev poetry_export_test clean verify ruff ruff_check ruff_format mypy test run docker-build help

git_clean:
	rm -rf .git && git init

poetry_export_all: poetry_export poetry_export_dev poetry_export_test

poetry_export: 
	poetry export -f requirements.txt --without-hashes --output requirements/requirements.txt

poetry_export_dev:
	poetry export -f requirements.txt --without-hashes --only dev --output requirements/requirements-dev.txt

poetry_export_test:
	poetry export -f requirements.txt --without-hashes --only test --output requirements/requirements-test.txt

clean:
    find . -type d -name "__pycache__" -exec rm -rf {} +
    find . -type f -name "*.pyc" -delete
    rm -rf .pytest_cache .mypy_cache .ruff_cache

verify: ruff mypy test

ruff: ruff_check ruff_format

ruff_check:
	ruff check --fix
	
ruff_format:
	 ruff format

mypy:
	mypy .

test:
    pytest -v --cov=.

run:
    python main.py

docker:
    docker build -t your-project-name .

help:
    @echo "Available commands:"
    @echo "  make poetry_export_all  - Export all requirements to txt files"
    @echo "  make git_clean          - purge all git data and init a new repo"
    @echo "  make verify             - Run all checks and tests"
    @echo "  make ruff               - Run Ruff linter and formatter"
    @echo "  make mypy               - Run MyPy type checker"
    @echo "  make test               - Run pytest"  
    @echo "  make run                - Execute the app"
    @echo "  make docker             - Build a container for the app"
