# Use the Alpine Linux base image
FROM alpine:latest

# Switch to root user for system updates
USER root

# Combine system updates and user setup in one RUN command
RUN apk update && \
    apk upgrade && \
    apk add --no-cache doas fish git && \
    rm -rf /var/cache/apk/* && \
    adduser -D -u 33333 gitpod && \
    addgroup gitpod wheel && \
    echo "gitpod ALL=(ALL) NOPASSWD: ALL" > /etc/doas.conf && \
    chsh -s /usr/bin/fish gitpod && \
    export SHELL=/usr/bin/fish

# Switch to the gitpod user
USER gitpod

# Set the entrypoint to start the Fish shell
ENTRYPOINT ["fish"]
