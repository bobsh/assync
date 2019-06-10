.PHONY: package-build
package-build: ## Build package ready for install
	$(PYTHON) setup.py build sdist bdist_wheel

.PHONY: package-install
package-install: ## Install package
	python3 setup.py install

.PHONY: package-dist
package-dist: ## Generate distribution packages for this build
	$(PYTHON) setup.py sdist bdist_wheel

.PHONY: package-upload
package-upload: ## Upload distribution packages in /dist to pypi
	$(PYTHON) -m twine upload --repository-url $(PYPI_REPO) dist/*

.PHONY: package-clean
package-clean: ## Clean package files
	python3 setup.py clean
	rm -rf dist build \
	  assync.egg-info \
	  .mypy_cache
