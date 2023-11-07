# Use the Alpine Linux base image
FROM alpine:latest

# Switch to root user for system updates
USER root

# Combine system updates and user setup in one RUN command
RUN apk update \
    && apk upgrade \
    && apk add --no-cache doas shadow bc make cmake binutils gcc clang lld lldb llvm fish git \
    rm -rf /var/cache/apk/*
    
RUN adduser -D -u 33333 gitpod \
    && addgroup gitpod wheel \
    && echo 'permit nopass gitpod as root' > /etc/doas.conf
