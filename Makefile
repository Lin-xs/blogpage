SHELL := /bin/bash
.PHONY: plugin show

plugin:
	@if [ ! -f book.json ]; then \
		echo "No book.json found. Create one."; \
    	echo "{\n\t\"plugins\": [\"summary\"]\n}" > book.json; \
	else \
		echo "book.json found. Install plugins..."; \
	fi
	gitbook install

show:
	. $$HOME/.nvm/nvm.sh; \
    NODE_VERSION=$$(node -v); \
    NODE_VERSION_MAJOR=$$(echo $$NODE_VERSION | sed 's#v##' | cut -d'.' -f1); \
    NODE_VERSION_MAX="10"; \
	if [ "$$NODE_VERSION_MAJOR" -gt "$$NODE_VERSION_MAX" ]; then \
		echo "Your node version $$NODE_VERSION is too high. Try to use version 10."; \
		nvm use $$NODE_VERSION_MAX; \
	fi;\
	gitbook serve