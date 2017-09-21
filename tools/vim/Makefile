VIM_VERSION := master

vim_dir := $(TOOLBOX_DIR)/tools/vim/$(VIM_VERSION)

vim_toolbox_dir := $(vim_dir)/.toolbox
vim_download := $(vim_toolbox_dir)/downloaded
vim_build := $(vim_toolbox_dir)/built
vim_install := $(vim_toolbox_dir)/installed
vim_link := $(vim_toolbox_dir)/linked

vim_src_dir := $(vim_dir)/src
vim_url := https://github.com/vim/vim.git
vim_src:= $(vim_src_dir)/vim
vim_install_dir := $(vim_dir)/install

.PHONY: install_vim
install_vim: $(vim_link)

$(vim_link): $(vim_install)
	$(call link_tool,$(vim_install_dir))
	touch $@

$(vim_install): $(vim_build)
	cd $(vim_src) && make install
	touch $@

$(vim_build): $(vim_download)
	cd $(vim_src) && ./configure \
			--with-features=huge \
			--enable-multibyte \
			--enable-rubyinterp=yes \
			--enable-python3interp=yes \
			--with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
			--enable-perlinterp=yes \
			--enable-luainterp=yes \
			--enable-luainterp=yes \
			--enable-gui=gtk2 \
			--enable-cscope \
			--prefix=$(vim_install_dir) && \
		make VIMRUNTIMEDIR=$(vim_install_dir)/share/vim/vim80
	touch $@

$(vim_download):
	mkdir -p $(vim_src_dir)
	cd $(vim_src_dir) && git clone $(vim_url)
	mkdir -p $(@D)
	touch $@
