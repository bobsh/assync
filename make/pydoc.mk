.PHONY: pdoc3-docs
pdoc3-docs:
	rm -rf docs/python && mkdir -p docs/python && \
	$(RUN) pdoc3 --html --output-dir docs/python/ .