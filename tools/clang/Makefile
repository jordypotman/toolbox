CLANG_VERSION := 3.9.0

clang_dir := $(TOOLBOX_DIR)/tools/clang/$(CLANG_VERSION)

clang_toolbox_dir := $(clang_dir)/.toolbox
clang_download := $(clang_toolbox_dir)/downloaded
clang_extract:= $(clang_toolbox_dir)/extracted
clang_build := $(clang_toolbox_dir)/built
clang_install := $(clang_toolbox_dir)/installed
clang_link := $(clang_toolbox_dir)/linked

clang_src_dir := $(clang_dir)/src
clang_url := http://llvm.org/releases/$(CLANG_VERSION)
clang_llvm_src_archive := llvm-$(CLANG_VERSION).src.tar.xz
clang_cfe_src_archive := cfe-$(CLANG_VERSION).src.tar.xz
clang_llvm_src := $(clang_src_dir)/llvm-$(CLANG_VERSION).src
clang_cfe_src := $(clang_src_dir)/cfe-$(CLANG_VERSION).src
clang_tools_clang_symlink := $(clang_llvm_src)/tools/clang
clang_build_dir := $(clang_dir)/build
clang_install_dir := $(clang_dir)/install

.PHONY: install_clang
install_clang: $(clang_link)

$(clang_link): $(clang_install)
	$(call link_tool,$(clang_install_dir))
	touch $@

$(clang_install): $(clang_build)
	cd $(clang_build_dir) && make install
	touch $@

$(clang_build): $(clang_extract)
	mkdir -p $(clang_build_dir)
	cd $(clang_build_dir) && \
		cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release \
			-DCMAKE_INSTALL_PREFIX=$(clang_install_dir) \
			$(clang_llvm_src) && \
		make
	touch $@

$(clang_extract): $(clang_download)
	cd $(clang_src_dir) && tar -xf $(clang_llvm_src_archive)
	cd $(clang_src_dir) && tar -xf $(clang_cfe_src_archive)
	ln -s $(clang_cfe_src) $(clang_tools_clang_symlink)
	touch $@

$(clang_download):
	mkdir -p $(clang_src_dir)
	cd $(clang_src_dir) && wget $(clang_url)/$(clang_llvm_src_archive)
	cd $(clang_src_dir) && wget $(clang_url)/$(clang_cfe_src_archive)
	mkdir -p $(@D)
	touch $@
