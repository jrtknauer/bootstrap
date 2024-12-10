# hadolint global ignore=DL3008
ARG RUST_VERSION=1.82
FROM rust:$RUST_VERSION-slim AS build

ARG STYLUA_VERSION
ENV STYLUA_VERSION=${STYLUA_VERSION:-2.0.1}
RUN cargo install --version $STYLUA_VERSION stylua

ENTRYPOINT ["stylua"]
CMD ["--help"]
