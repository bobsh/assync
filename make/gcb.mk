.PHONY: gcb-local
gcb-local: ## Run the Google Cloud Build locally
	cloud-build-local --dryrun=false .

.PHONY: gcb-tools
gcb-tools: ## Install GCB tooling
	gcloud components install cloud-build-local