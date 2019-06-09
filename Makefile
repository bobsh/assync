include make/*.mk

.PHONY: clean
clean: package-clean pipenv-clean ## Clean all

.PHONY: tools
tools: package-tools pipenv-tools gcb-tools ## Install all tools for development

.PHONY: deps
deps: pipenv-deps ## Install all project dependencies
