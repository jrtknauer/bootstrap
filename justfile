default:
    @just --list --unsorted

[group('build')]
build: build-stylua

[group('format')]
format: build format-lua

[group('lint')]
lint: build lint-dockerfile lint-lua lint-shell

hadolint_image := "hadolint/hadolint"
hadolint_version := "v2.12.0"
hadolint_config := ".hadolint.yaml"
[group('lint')]
lint-dockerfile:
    @for f in `find . -name '*Dockerfile' -print`; do \
        docker run \
            --rm \
            --interactive \
            {{hadolint_image}}:{{hadolint_version}} \
            hadolint - < $f; \
    done

stylua_image := "bootstrap/stylua"
stylua_version := "2.0.1"
rust_version := "1.82"
[group('build')]
build-stylua:
    docker build \
        --build-arg STYLUA_VERSION={{stylua_version}} \
        --build-arg RUST_VERSION={{rust_version}} \
        --file docker/stylua.Dockerfile \
        --tag {{stylua_image}}:{{stylua_version}} \
        .

[group('lint')]
lint-lua:
    docker run \
        --mount type=bind,src=$(pwd),dst=/workdir \
        --rm \
        --tty \
        --workdir /workdir \
        {{stylua_image}}:{{stylua_version }} \
        --allow-hidden --check --verbose .

[group('format')]
format-lua:
    docker run \
        --mount type=bind,src=$(pwd),dst=/workdir \
        --rm \
        --tty \
        --workdir /workdir \
        {{stylua_image}}:{{stylua_version }} \
        --allow-hidden --verify --verbose .

shellcheck_image := "koalaman/shellcheck"
shellcheck_version := "v0.10.0"
[group('lint')]
lint-shell:
    docker run \
        --mount type=bind,src=$(pwd),dst=/mnt \
        --mount type=bind,src=$(pwd)/.shellcheckrc,dst=/shellcheckrc \
        --rm \
        {{shellcheck_image}}:{{shellcheck_version }} \
        $(find . -type f -name "*.sh")
