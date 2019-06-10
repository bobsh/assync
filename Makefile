include make/*.mk

.PHONY: clean
clean: package-clean pipenv-clean pytest-clean ## Clean all

.PHONY: tools
tools: package-tools pipenv-tools gcb-tools ## Install all tools for development

.PHONY: deps
deps: pipenv-deps ## Install all project dependencies

.PHONY: lint
lint: pylama-lint bandit-lint prospector-lint ## Lint all

.PHONY: test
test: pytest-test ## Run all tests