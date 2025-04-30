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

.PHONY: format
format: build
	docker run \
        --mount type=bind,src=$$(pwd),dst=/workdir \
        --rm \
        --tty \
        --workdir /workdir \
		bootstrap/stylua:latest \
        --allow-hidden --verify --verbose .

.PHONY: build
build: build-stylua

.PHONY: build-stylua
build-stylua:
	$(MAKE) -C docker stylua
