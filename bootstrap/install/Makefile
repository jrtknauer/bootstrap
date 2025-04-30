
TARGETS := $(wildcard */)

BOOTSTRAP_TARGETS := uv/ docker/
BOOTSTRAP := $(filter-out $(BOOTSTRAP_TARGETS),$(TARGETS))

WSL_SKIP_TARGETS := chrome/
WSL_TARGETS := $(filter-out $(WSL_SKIP_TARGETS),$(TARGETS))

.PHONY: all
all: bootstrap
	for target in $(TARGETS); do \
		$(MAKE) -C $$target install; \
	done

.PHONY: wsl
wsl: bootstrap
	for target in $(WSL_TARGETS); do \
		$(MAKE) -C $$target install; \
	done

.PHONY: bootstrap
bootstrap:
	bash bootstrap.sh
	for target in $(BOOTSTRAP); do \
		$(MAKE) -C $$target install; \
	done

.PHONY: install-%
install-%:
	$(MAKE) -C $* install

.PHONY: uninstall-%
uninstall-%:
	$(MAKE) -C $* uninstall
