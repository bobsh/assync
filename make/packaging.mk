.PHONY: package-dist
package-dist: ## Generate distribution packages for this build
	$(PYTHON) setup.py sdist bdist_wheel

.PHONY: package-upload
package-upload: ## Upload distribution packages in /dist to pypi
	$(PYTHON) -m twine upload --repository-url $(PYPI_REPO) dist/*

.PHONY: package-clean
package-clean: ## Clean package files
	rm -rf dist build \
	  assync.egg-info \
	  .mypy_cache
