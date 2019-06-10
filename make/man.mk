.PHONY: man-build
man-build: ## Install man pages from click commands
	$(PYTHON) setup.py --command-packages=click_man.commands man_pages

.PHONY: man-clean
man-clean: ## Remove man files
	rm -rf man/