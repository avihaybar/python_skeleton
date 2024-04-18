git_clean:
	rm -rf .git && git init

poetry_export_all: poetry_export poetry_export_dev poetry_export_test

poetry_export: 
	poetry export -f requirements.txt --without-hashes --output requirements/requirements.txt

poetry_export_dev:
	poetry export -f requirements.txt --without-hashes --with dev --output requirements/requirements-dev.txt

poetry_export_test:
	poetry export -f requirements.txt --without-hashes --with test --output requirements/requirements-test.txt

verify: ruff mypy test

ruff: ruff_check ruff_format

ruff_check:
	ruff check --fix
	
ruff_format:
	 ruff format

mypy:
	mypy .

test:
	pytest