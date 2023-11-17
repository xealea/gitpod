# Use the latest Alpine image as the base image
FROM alpine:latest

# Install necessary packages
RUN apk add --no-cache \
    bash \
    sudo \
    git \
    openssh-client \
    curl \
    wget \
    nodejs \
    npm \
    yarn \
    python3 \
    py3-pip \
    && rm -rf /var/cache/apk/*

# Set up a non-root user with sudo access
ARG USER=gitpod
ARG UID=1000
ARG GID=1000
RUN adduser -D -u $UID -g $GID $USER \
    && echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/$USER \
    && chmod 0440 /etc/sudoers.d/$USER

# Set environment variables
ENV HOME /home/$USER
ENV SHELL /bin/bash

# Switch to the non-root user
USER $USER

# Set the working directory
WORKDIR $HOME

# Expose the needed ports (if any)
# EXPOSE <port>

# Optional: You can add your custom configurations and installations here

# Start a default command (if any)
# CMD ["bash"]
