# hadolint global ignore=DL3008,DL3015
FROM ubuntu:noble AS build

ARG NEOVIM_VERSION
ENV NEOVIM_VERSION=${NEOVIM_VERSION:-v0.10.2}

WORKDIR /build

RUN <<EOF
apt-get update
apt-get upgrade --yes
apt-get install \
    --yes \
	build-essential \
	ca-certificates \
	cmake \
	curl \
	gettext \
	ninja-build \
	unzip
apt-get clean
rm --force --recursive /var/lib/apt/lists/*
EOF

RUN <<EOF
mkdir neovim-$NEOVIM_VERSION
curl \
    --location \
    --show-error \
    --output neovim-$NEOVIM_VERSION.tar.gz \
    https://github.com/neovim/neovim/archive/refs/tags/$NEOVIM_VERSION.tar.gz
tar \
    --directory=neovim-$NEOVIM_VERSION \
    --extract \
    --gzip \
    --strip-components=1 \
    --verbose \
    --file=neovim-$NEOVIM_VERSION.tar.gz
EOF

WORKDIR /build/neovim-$NEOVIM_VERSION

# https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-source
RUN <<EOF
make CMAKE_BUILD_TYPE="Release" CMAKE_EXTRA_FLAGS="DCMAKE_INSTALL_PREFIX=/build/out/neovim-$NEOVIM_VERSION"
make install
EOF

FROM scratch AS output
COPY --from=build /build/out /

ENTRYPOINT ["/"]
