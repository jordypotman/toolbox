SHELL := /bin/bash
TOOLBOX_DIR := $(HOME)/toolbox

#
# Usage: $(call link_tool,tool_install_dir)
#
# $(1): tool_install_dir
#
define link_tool
	find $(1) \! -type d -print0 | while IFS= read -r -d '' file; do \
		link="$(TOOLBOX_DIR)$${file#$(1)}"; \
		[ -e "$${link}" ] && continue; \
		mkdir -p "$$(dirname "$${link}")"; \
		ln -s "$${file}" "$${link}"; \
	done
endef

default:
	# Do nothing.

include tools/*/Makefile
