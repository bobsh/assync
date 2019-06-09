.PHONY: package-dist
package-dist: ## Generate distribution packages for this build
	python3 setup.py sdist bdist_wheel

.PHONY: package-upload
package-upload: ## Upload distribution packages in /dist to pypi
	python3 -m twine upload --repository-url $(PYPI_REPO) dist/*

.PHONY: package-clean
package-clean: ## Clean package files
	rm -rf dist build \
	  *.egg-info \
	  .mypy_cache

.PHONY: package-tools
package-tools: ## Install tools for packaging
	pip3 install --user --upgrade setuptools twine wheel