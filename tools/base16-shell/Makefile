BASE16_SHELL_VERSION := master

base16_shell_dir := $(TOOLBOX_DIR)/tools/base16-shell/$(BASE16_SHELL_VERSION)

base16_shell_toolbox_dir := $(base16_shell_dir)/.toolbox
base16_shell_download := $(base16_shell_toolbox_dir)/downloaded

base16_shell_url := https://github.com/chriskempson/base16-shell.git

.PHONY: install_base16_shell
install_base16_shell: $(base16_shell_download)

$(base16_shell_download):
	mkdir -p $(base16_shell_dir)
	cd $(base16_shell_dir) && git clone $(base16_shell_url)
	mkdir -p $(@D)
	touch $@
