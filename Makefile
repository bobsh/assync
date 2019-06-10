include make/*.mk

.PHONY: all
all: clean tools deps lint test ## Run clean, tools, deps, lint, test

.PHONY: tools
tools: pipenv-tools ## Install all tools for development

.PHONY: deps
deps: pipenv-deps ## Install all project dependencies

.PHONY: lint
lint: yamllint-lint pylama-lint bandit-lint prospector-lint ## Lint all

.PHONY: test
test: pytest-test ## Run all tests

.PHONY: clean
clean: package-clean pipenv-clean pytest-clean ## Clean all
	find . -type f -name "*.py[co]" -delete
	find . -type d -name "__pycache__" -delete