
TARGETS := $(wildcard */)

.PHONY: all
install:
	for target in $(TARGETS); do \
		$(MAKE) -C $$target install; \
	done
