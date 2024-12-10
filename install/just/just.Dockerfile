# hadolint global ignore=DL3008
ARG RUST_VERSION=1.82
FROM rust:$RUST_VERSION-slim AS build

ARG JUST_VERSION=1.37.0
ENV JUST_VERSION=${JUST_VERSION:-1.37.0}
RUN cargo install \
    --root /.cargo \
    --version $JUST_VERSION \
    just

FROM scratch AS output
COPY --from=build .cargo/bin/just /

ENTRYPOINT ["/"]
