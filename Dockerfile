# Use the Fedora base image
FROM fedora:latest

# Switch to root user for system updates
USER root

# Combine system updates and user setup in one RUN command
RUN dnf update -y && \
    dnf install -y sudo shadow-utils bc make cmake binutils gcc clang lld lldb llvm fish git && \
    dnf clean all

RUN useradd -u 33333 -m gitpod && \
    usermod -aG wheel gitpod && \
    echo 'gitpod ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/gitpod

USER gitpod
