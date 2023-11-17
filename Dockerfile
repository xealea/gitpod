# Use the Arch Linux base image
FROM archlinux:latest

# Switch to root user for system updates
USER root

# Combine system updates, installation, and user setup in one RUN command
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm sudo base-devel clang lldb llvm fish git binutils ncurses libelf openssl perl rsync tar xz zstd
    
RUN useradd -u 33333 -m -s /usr/bin/fish gitpod && \
    usermod -aG wheel gitpod && \
    echo 'gitpod ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/gitpod

# Set Fish as the default shell for the gitpod user
RUN chsh -s /usr/bin/fish

# Set the entry point to start the shell
ENTRYPOINT [ "/usr/bin/fish" ]
