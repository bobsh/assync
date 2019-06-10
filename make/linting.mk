.PHONY: yamllint-lint
yamllint-lint: ## Run yamllint linting
	$(RUN) yamllint -c lint/yamllint.yaml .

.PHONY: bandit-lint
bandit-lint: ## Run bandit linting
	$(RUN) bandit -q -r assert

.PHONY: pylama-lint
pylama-lint: ## Run pylama linting
	$(PYTHON) -m pylama --options lint/pylama.ini

.PHONY: prospector-lint
prospector-lint: ## Run prospector linting
	$(RUN) prospector -P lint/prospector.yaml