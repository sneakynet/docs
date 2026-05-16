FROM docker.io/library/golang:1.24-alpine AS mdbook-d2
RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    go install github.com/Vaelatern/mdbook-d2-go@latest

FROM ghcr.io/peaceiris/mdbook:v0.4.34 AS build
COPY . .
COPY --from=mdbook-d2 /go/bin/mdbook-d2-go /usr/local/bin/mdbook-d2-go
RUN mdbook build

FROM docker.io/library/nginx:1.25-alpine
COPY --from=build /book/book/ /usr/share/nginx/html/
EXPOSE 80/tcp
