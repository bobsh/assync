.PHONY: pipenv-deps
pipenv-deps: ## Install pipenv dependencies
	pipenv install --dev --three --skip-lock

.PHONY: pipenv-tools
pipenv-tools: ## Install pipenv-tools
	pip3 install --user --upgrade pipenv

.PHONY: pipenv-clean
pipenv-clean: ## Clean pipenv
	rm -f Pipfile.lock