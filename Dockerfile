# Use an Alpine Linux base image
FROM alpine:latest

# Install necessary packages and configure sudo
RUN apk update && apk upgrade && \
    apk add --no-cache sudo shadow && \
    rm -rf /var/cache/apk/* && \
    useradd -u 33333 -G wheel -m -s /bin/bash gitpod && \
    sed -i 's/%wheel ALL=(ALL) ALL/%wheel ALL=(ALL) NOPASSWD:ALL/g' /etc/sudoers

# Switch to the gitpod user
USER root

# Any additional commands for the gitpod user can be added here
