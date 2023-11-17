# Use the latest Alpine image as the base image
FROM alpine:latest

# Set up a non-root user with sudo access
ARG USER=gitpod
ARG UID=33333
ARG GID=33333

# Ensure the group with the correct GID exists
RUN addgroup -g $GID $USER

# Create the user with the specified UID and GID
RUN adduser -D -u $UID -G $USER -g $USER $USER

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
