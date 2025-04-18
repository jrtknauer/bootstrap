VENV := .venv

.PHONY: all
all: install

.PHONY: install
install:
	@python3 -m bootstrap.main

.PHONY: dev
dev:
	virtualenv $(VENV)
	$(VENV)/bin/pip install --upgrade pip
	$(VENV)/bin/pip install uv
	$(VENV)/bin/uv sync
