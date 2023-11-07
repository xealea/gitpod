# from image
FROM alpine:latest

# user
USER root

RUN apk update && apk upgrade && \
    apk add --no-cache shadow doas && \
    rm -rf /var/cache/apk/*

RUN adduser -D -u 33333 gitpod && \
    addgroup gitpod wheel && \
    echo "gitpod ALL=(ALL) NOPASSWD: ALL" > /etc/doas.conf
