ALL_TARGETS := $(wildcard */)
BOOTSTRAP_TARGETS := uv/ docker/
POST_BOOTSTRAP_TARGETS := $(filter-out $(BOOTSTRAP_TARGETS),$(ALL_TARGETS))

WSL_SKIP_TARGETS := chrome/ mattermost/ protonvpn/
WSL_TARGETS := $(filter-out $(WSL_SKIP_TARGETS),$(ALL_TARGETS))

.PHONY: all
all: bootstrap
	for target in $(POST_BOOTSTRAP_TARGETS); do \
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
	for target in $(BOOTSTRAP_TARGETS); do \
		$(MAKE) -C $$target install; \
	done

.PHONY: install-%
install-%:
	$(MAKE) -C $* install

.PHONY: uninstall-%
uninstall-%:
	$(MAKE) -C $* uninstall
