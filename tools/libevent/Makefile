LIBEVENT_VERSION := 2.0.22

libevent_dir := $(TOOLBOX_DIR)/tools/libevent/$(LIBEVENT_VERSION)

libevent_toolbox_dir := $(libevent_dir)/.toolbox
libevent_download := $(libevent_toolbox_dir)/downloaded
libevent_extract:= $(libevent_toolbox_dir)/extracted
libevent_build := $(libevent_toolbox_dir)/built
libevent_install := $(libevent_toolbox_dir)/installed
libevent_link := $(libevent_toolbox_dir)/linked

libevent_src_dir := $(libevent_dir)/src
libevent_url := https://github.com/libevent/libevent/releases/download/release-$(LIBEVENT_VERSION)-stable
libevent_src_archive := libevent-$(LIBEVENT_VERSION)-stable.tar.gz
libevent_build_dir := $(libevent_dir)/build
libevent_src:= $(libevent_src_dir)/libevent-$(LIBEVENT_VERSION)-stable
libevent_install_dir := $(libevent_dir)/install

.PHONY: install_libevent
install_libevent: $(libevent_link)

$(libevent_link): $(libevent_install)
	$(call link_tool,$(libevent_install_dir))
	touch $@

$(libevent_install): $(libevent_build)
	cd $(libevent_build_dir) && make install
	touch $@

$(libevent_build): $(libevent_extract)
	mkdir -p $(libevent_build_dir)
	cd $(libevent_build_dir) && \
		$(libevent_src)/configure --disable-openssl \
		--prefix=$(libevent_install_dir) && \
		make
	touch $@

$(libevent_extract): $(libevent_download)
	cd $(libevent_src_dir) && tar -xf $(libevent_src_archive)
	touch $@

$(libevent_download):
	mkdir -p $(libevent_src_dir)
	cd $(libevent_src_dir) && wget $(libevent_url)/$(libevent_src_archive)
	mkdir -p $(@D)
	touch $@
