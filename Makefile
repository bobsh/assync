include make/*.mk

.PHONY: all
all: clean tools deps lint test build install ## Run clean, tools, deps, lint, test, build, install

.PHONY: tools
tools: pipenv-tools nats-tools ## Install all tools for development

.PHONY: deps
deps: pipenv-deps ## Install all project dependencies

.PHONY: lint
lint: yamllint-lint pylama-lint bandit-lint prospector-lint ## Lint all

.PHONY: test
test: pytest-test ## Run all tests

.PHONY: build
build: man-build package-build ## Build all

.PHONY: docs
docs: pdoc3-docs ## Document all

.PHONY: install
install: package-install ## Install

.PHONY: clean
clean: package-clean pipenv-clean pytest-clean nats-clean man-clean ## Clean all
	find . -type f -name "*.py[co]" -delete
	find . -type d -name "__pycache__" -delete