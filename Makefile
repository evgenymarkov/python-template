.PHONY: setup
setup:
	@echo Installing dependencies
	@pipenv install

	@echo Setting up git hooks
	@git config core.hooksPath .githooks

.PHONY: format
format:
	@echo Running formatters...
	@isort --atomic .
	@black .

.PHONY: lint
lint:
	@echo Running linters...
	@black --check .
	@pyright
	@flake8

.PHONY: test
test:
	@echo Running tests...

.PHONY: coverage
coverage:
	@echo Calculating test coverage...
