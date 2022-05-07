FROM rust:1.58 as builder

WORKDIR /usr/src/myapp
COPY . .
RUN cargo install --path .

FROM debian:bullseye-slim
COPY --from=builder /usr/local/cargo/bin/test_api_for_apprunner /usr/local/bin/myapp
CMD ["myapp"]
