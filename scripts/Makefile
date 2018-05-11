toolbox_bin_dir := $(TOOLBOX_DIR)/bin
toolbox_scripts_dir := $(TOOLBOX_DIR)/scripts

termcolors_link := $(toolbox_bin_dir)/termcolors
termcolors_script := $(toolbox_scripts_dir)/termcolors

.PHONY: install_scripts
install_scripts: $(termcolors_link)

$(termcolors_link): $(termcolors_script)
	mkdir -p $(@D)
	ln -s $(termcolors_script) $(termcolors_link)
