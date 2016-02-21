TMUX_VERSION := 2.1

tmux_dir := $(TOOLBOX_DIR)/tools/tmux/$(TMUX_VERSION)

tmux_toolbox_dir := $(tmux_dir)/.toolbox
tmux_download := $(tmux_toolbox_dir)/downloaded
tmux_extract:= $(tmux_toolbox_dir)/extracted
tmux_build := $(tmux_toolbox_dir)/built
tmux_install := $(tmux_toolbox_dir)/installed
tmux_link := $(tmux_toolbox_dir)/linked

tmux_src_dir := $(tmux_dir)/src
tmux_url := https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
tmux_src_archive := tmux-$(TMUX_VERSION).tar.gz
tmux_build_dir := $(tmux_dir)/build
tmux_src:= $(tmux_src_dir)/tmux-$(TMUX_VERSION)
tmux_install_dir := $(tmux_dir)/install

.PHONY: install_tmux
install_tmux: $(tmux_link)

$(tmux_link): $(tmux_install)
	$(call link_tool,$(tmux_install_dir))
	touch $@

$(tmux_install): $(tmux_build)
	cd $(tmux_build_dir) && make install
	touch $@

$(tmux_build): $(tmux_extract)
	mkdir -p $(tmux_build_dir)
	# LDFLAGS=-Wl,-rpath=$HOME/toolbox/lib,--enable-new-dtags
	# PKG_CONFIG_PATH=$HOME/toolbox/lib/pkgconfig
	cd $(tmux_build_dir) && \
		$(tmux_src)/configure --prefix=$(tmux_install_dir) && \
		make
	touch $@

$(tmux_extract): $(tmux_download)
	cd $(tmux_src_dir) && tar -xf $(tmux_src_archive)
	touch $@

$(tmux_download):
	mkdir -p $(tmux_src_dir)
	cd $(tmux_src_dir) && wget $(tmux_url)/$(tmux_src_archive)
	mkdir -p $(@D)
	touch $@
