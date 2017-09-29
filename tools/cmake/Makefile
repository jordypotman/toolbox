CMAKE_VERSION := 3.9.3

cmake_dir := $(TOOLBOX_DIR)/tools/cmake/$(CMAKE_VERSION)

cmake_toolbox_dir := $(cmake_dir)/.toolbox
cmake_download := $(cmake_toolbox_dir)/downloaded
cmake_build := $(cmake_toolbox_dir)/built
cmake_install := $(cmake_toolbox_dir)/installed
cmake_link := $(cmake_toolbox_dir)/linked

cmake_src_dir := $(cmake_dir)/src
cmake_url := https://gitlab.kitware.com/cmake/cmake.git
cmake_src:= $(cmake_src_dir)/cmake
cmake_install_dir := $(cmake_dir)/install

.PHONY: install_cmake
install_cmake: $(cmake_link)

$(cmake_link): $(cmake_install)
	$(call link_tool,$(cmake_install_dir))
	touch $@

$(cmake_install): $(cmake_build)
	cd $(cmake_src) && make install
	touch $@

$(cmake_build): $(cmake_download)
	cd $(cmake_src) && ./bootstrap --prefix=$(cmake_install_dir) && make
	touch $@

$(cmake_download):
	mkdir -p $(cmake_src_dir)
	cd $(cmake_src_dir) && \
		git clone --branch v$(CMAKE_VERSION) --depth 1 $(cmake_url)
	mkdir -p $(@D)
	touch $@
