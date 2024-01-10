# Use the Void Linux base image
FROM xealea/void:latest

# Switch to root user for system updates
USER root

# Combine system updates, installation, and user setup in one RUN command
RUN xbps-install -Syu

RUN useradd -u 33333 -m -s /bin/bash gitpod && \
    usermod -aG wheel gitpod && \
    echo 'gitpod ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/gitpod

RUN useradd -u 33333 -m -s /usr/bin/fish gitpod && \
    usermod -aG wheel gitpod && \
    echo 'gitpod ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/gitpod

# shell cmd
SHELL ["fish", "--command"]

# set shell use fish
RUN chsh -s /usr/bin/fish

# env fish
ENV SHELL /usr/bin/fish

# entrypoint
ENTRYPOINT [ "fish" ]
