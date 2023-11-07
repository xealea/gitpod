# Use a Fedora base image
FROM fedora:latest

# Install necessary packages as the root user
RUN dnf -y update && dnf install -y dnf-plugins-core git sudo && dnf clean all

# Create a non-root user and give it sudo privileges without a password
RUN useradd -m -s /bin/bash gitpod \
    && echo "gitpod ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to the non-root user
USER root

# You can add more configurations or software installations here if necessary
