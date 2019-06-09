.PHONY: pipenv-deps
pipenv-deps: ## Install pipenv dependencies
	pipenv install --three --skip-lock --verbose

.PHONY: pipenv-tools
pipenv-tools: ## Install pipenv-tools
	pip3 install --user --upgrade pipenv

.PHONY: pipenv-clean
pipenv-clean: ## Clean pipenv
	pipenv clean --three --verbose