# Use the Arch Linux base image
FROM archlinux:latest

# Switch to root user for system updates
USER root

# Combine system updates, installation, and user setup in one RUN command
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm sudo base-devel clang lldb llvm fish git binutils ncurses libelf openssl perl rsync tar xz zstd && \
    git clone https://aur.archlinux.org/paru.git && \
    cd paru && \
    makepkg -si --noconfirm && \
    cd .. && \
    rm -rf paru && \
    pacman -Sc --noconfirm

RUN useradd -u 33333 -m -s /usr/bin/fish gitpod && \
    usermod -aG wheel gitpod && \
    echo 'gitpod ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/gitpod

USER gitpod
