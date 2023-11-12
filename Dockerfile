# Use the Arch Linux base image
FROM archlinux:latest

# Switch to root user for system updates
USER root

# Combine system updates and user setup in one RUN command
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm sudo base-devel clang lldb llvm fish git binutils ncurses libelf openssl perl rsync tar xz zstd && \
    pacman -Sc --noconfirm

RUN useradd -u 33333 -m gitpod && \
    usermod -aG wheel gitpod && \
    echo 'gitpod ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/gitpod

USER gitpod
