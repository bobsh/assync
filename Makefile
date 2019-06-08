include make/*.mk


gcb: ## Run the Google Cloud Build locally
	cloud-build-local --dryrun=false .
.PHONY: gcb

deps: ## Download project dependencies
	pipenv install
.PHONY: deps

dist: ## Generate distribution packages for this build
	python3 setup.py sdist bdist_wheel
.PHONY: dist

up: ## Upload distribution packages in /dist to pypi
	python3 -m twine upload --repository-url $(PYPI_REPO) dist/*
.PHONY: up


