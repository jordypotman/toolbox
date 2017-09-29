NINJA_VERSION := 1.8.2

ninja_dir := $(TOOLBOX_DIR)/tools/ninja/$(NINJA_VERSION)

ninja_toolbox_dir := $(ninja_dir)/.toolbox
ninja_download := $(ninja_toolbox_dir)/downloaded
ninja_build := $(ninja_toolbox_dir)/built
ninja_install := $(ninja_toolbox_dir)/installed
ninja_link := $(ninja_toolbox_dir)/linked

ninja_src_dir := $(ninja_dir)/src
ninja_url := https://github.com/ninja-build/ninja.git
ninja_src:= $(ninja_src_dir)/ninja
ninja_install_dir := $(ninja_dir)/install

.PHONY: install_ninja
install_ninja: $(ninja_link)

$(ninja_link): $(ninja_install)
	$(call link_tool,$(ninja_install_dir))
	touch $@

$(ninja_install): $(ninja_build)
	mkdir -p $(ninja_install_dir)/bin
	cp $(ninja_src)/ninja $(ninja_install_dir)/bin
	mkdir -p $(ninja_install_dir)/share/ninja
	cp $(ninja_src)/misc/bash-completion $(ninja_install_dir)/share/ninja
	touch $@

$(ninja_build): $(ninja_download)
	cd $(ninja_src) && ./configure.py --bootstrap
	touch $@

$(ninja_download):
	mkdir -p $(ninja_src_dir)
	cd $(ninja_src_dir) && \
		git clone --branch v$(NINJA_VERSION) --depth 1 $(ninja_url)
	mkdir -p $(@D)
	touch $@
