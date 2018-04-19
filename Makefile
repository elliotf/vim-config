update:
	git pull --rebase && \
	git submodule update --recursive --remote

.PHONY: update
