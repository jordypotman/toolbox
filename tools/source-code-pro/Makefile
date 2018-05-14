SOURCE_CODE_PRO_ROMAN_VERSION := 2.030R-ro
SOURCE_CODE_PRO_ITALIC_VERSION := 1.050R-it

source_code_pro_dir := $(TOOLBOX_DIR)/tools/source-code-pro/$(SOURCE_CODE_PRO_ROMAN_VERSION)-$(SOURCE_CODE_PRO_ITALIC_VERSION)

source_code_pro_toolbox_dir := $(source_code_pro_dir)/.toolbox
source_code_pro_download := $(source_code_pro_toolbox_dir)/downloaded
source_code_pro_extract := $(source_code_pro_toolbox_dir)/extracted

source_code_pro_url := https://github.com/adobe-fonts/source-code-pro/archive/$(SOURCE_CODE_PRO_ROMAN_VERSION)/
source_code_pro_archive := $(SOURCE_CODE_PRO_ITALIC_VERSION).zip

.PHONY: install_source_code_pro
install_source_code_pro: $(source_code_pro_extract)

$(source_code_pro_extract): $(source_code_pro_download)
	cd $(source_code_pro_dir) && unzip $(source_code_pro_archive)
	touch $@

$(source_code_pro_download):
	mkdir -p $(source_code_pro_dir)
	cd $(source_code_pro_dir) && wget $(source_code_pro_url)/$(source_code_pro_archive)
	mkdir -p $(@D)
	touch $@
