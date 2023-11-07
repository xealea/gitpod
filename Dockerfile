# FROM image
FROM alpine:latest

USER root

RUN apk update && apk upgrade && \
    apk add --no-cache shadow doas fish git && \ # Add 'git' package here
    rm -rf /var/cache/apk/*

RUN adduser -D -u 33333 gitpod && \
    addgroup gitpod wheel && \
    echo "gitpod ALL=(ALL) NOPASSWD: ALL" > /etc/doas.conf

# user
USER gitpod

# set default shell to fish
SHELL ["fish", "--version"]

# set fish as the default shell
RUN chsh -s /usr/bin/fish gitpod

# set SHELL environment variable
ENV SHELL /usr/bin/fish

# set entrypoint
ENTRYPOINT ["fish"]
