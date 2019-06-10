.PHONY: pytest-test
pytest-test: ## Run pytest tests
	pipenv run pytest

.PHONY: pytest-clean
pytest-clean: ## Clean pytest files
	rm -rf .pytest_cache/