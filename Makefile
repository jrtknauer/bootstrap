.PHONY: all
all: stow
	$(MAKE) -C bootstrap/install all

.PHONY: wsl
wsl: stow
	$(MAKE) -C bootstrap/install wsl

.PHONY: stow
stow: bootstrap
	$(MAKE) -C bootstrap/dotfiles all

.PHONY: bootstrap
bootstrap:
	$(MAKE) -C bootstrap/install bootstrap

.PHONY: install-%
install-%:
	$(MAKE) -C bootstrap/install install-$*

.PHONY: uninstall-%
uninstall-%:
	$(MAKE) -C bootstrap/install uninstall-$*

.PHONY: lint
lint:
	@shfmt \
		--diff \
		.
	@find \
		. \
		-type f \
		-name *.sh \
		| xargs -r shellcheck --external-sources
	@docker run \
        --mount type=bind,src=$$(pwd),dst=/workdir \
		--quiet \
        --rm \
        --tty \
        --workdir /workdir \
		bootstrap/stylua:latest \
        --allow-hidden \
		--check \
		.

.PHONY: format
format: build
	@shfmt \
		--list \
		--write \
		.
	@docker run \
        --mount type=bind,src=$$(pwd),dst=/workdir \
		--quiet \
        --rm \
        --tty \
        --workdir /workdir \
		bootstrap/stylua:latest \
        --allow-hidden \
		--verify \
		.

.PHONY: build
build: build-stylua

.PHONY: build-stylua
build-stylua:
	@$(MAKE) -C docker stylua
