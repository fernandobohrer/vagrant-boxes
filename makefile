.DEFAULT_GOAL := .check-target

.PHONY: .check-target
.check-target:
	$(error No target specified. Please provide a target and try again.)

.PHONY: .check-image-variable
.check-image-variable:
ifndef image
	$(error The image variable is not set! Please define the image variable and try again.)
endif

.PHONY: build
build: .check-image-variable
	cd ${image}/packer && \
	packer init . && \
	packer build -var "vagrant_box_version=$(shell date -u +%Y%m%d.%H%M)" .

.PHONY: cleanup
cleanup:
	@FOLDERS_TO_DELETE="builds .ansible .vagrant"; \
	for F in $$FOLDERS_TO_DELETE ; do \
		find . -type d -iname "$$F" -prune -print -exec rm -rf {} \;; \
	done
