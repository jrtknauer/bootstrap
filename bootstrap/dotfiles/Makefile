PACKAGES := $(wildcard */)

.PHONY: all
all:
	@dotfiles_dir=$$(pwd); \
	for package in $(PACKAGES); do \
		stow \
			--restow \
			--verbose \
			--dir=$$dotfiles_dir \
			--target=$${HOME} \
			$$package; \
	done
