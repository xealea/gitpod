# Use the Alpine Linux base image
FROM alpine:latest

# Switch to root user for system updates
USER root

# Combine system updates and user setup in one RUN command
RUN apk update \
    && apk upgrade \
    && apk add --no-cache doas shadow bc make cmake binutils gcc clang lld lldb llvm fish git \
    rm -rf /var/cache/apk/*
    
RUN useradd -l -u 33333 -G wheel -md /home/gitpod -s /bin/bash -p gitpod gitpod \
    sed -i.bkp -e 's/%wheel\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%wheel ALL=NOPASSWD:ALL/g' /etc/doas.conf
