FROM ghcr.io/peaceiris/mdbook:v0.4.34 AS build
COPY . .
RUN mdbook build

FROM docker.io/library/nginx:1.25-alpine
COPY --from=build /book/book/ /usr/share/nginx/html/
EXPOSE 80/tcp
