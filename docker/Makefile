
.PHONY: stylua
stylua:
	docker build \
		--build-arg STYLUA_VERSION=2.1.0 \
		--build-arg RUST_VERSION=1.86 \
		--file stylua.Dockerfile \
		--tag bootstrap/stylua:latest \
		.
