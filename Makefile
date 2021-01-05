.PHONY: init
init:
	@echo Installing dependencies...
	@poetry install

	@echo Setting up git hooks...
	@git config core.hooksPath .githooks

.PHONY: format
format:
	@echo Running formatters...
	@poetry run isort --atomic .
	@poetry run black .

.PHONY: lint
lint:
	@echo Running linters...
	@poetry run flakehell lint .
	@poetry run black --check .
	@pyright

.PHONY: test
test:
	@echo Running tests...
	@poetry run pytest

.PHONY: coverage
coverage:
	@echo Calculating test coverage...
	@poetry run pytest --cov
	@poetry run coverage erase
