SRCFILES = $(wildcard *.sh)
SHFMT_BASE_FLAGS = -s -i 2 -ci

.PHONY: all
all: lint format-check

.PHONY: format
format:
	shfmt -w $(SHFMT_BASE_FLAGS) $(SRCFILES)

.PHONY: format-check
format-check:
	shfmt -d $(SHFMT_BASE_FLAGS) $(SRCFILES)

.PHONY: lint
lint:
	shellcheck $(SRCFILES)
