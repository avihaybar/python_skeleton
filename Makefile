poetry_export_all: poetry_export poetry_export_dev poetry_export_test

poetry_export: 
	poetry export -f requirements.txt --without-hashes --output requirements.txt

poetry_export_dev:
	poetry export -f requirements.txt --without-hashes --with dev --output requirements-dev.txt

poetry_export_test:
	poetry export -f requirements.txt --without-hashes --with test --output requirements-test.txt

verify: ruff mypy vulture test

ruff: ruff_check ruff_format

ruff_check:
	ruff check --fix
	
ruff_format:
	 ruff format

mypy:
	mypy .

vulture:
	vulture .

test:
	pytest