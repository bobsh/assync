.DEFAULT_GOAL := help
.PHONY: help-all
help-all: ## This output. A complete list of all commands.
	@grep -h -E '^[ a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: help
help: ## This output. Lists commands and help for each (make help-all for more commands)
	@grep -h -E '^[ a-zA-Z0-9]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
