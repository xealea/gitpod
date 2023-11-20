# Use the Void Linux base image
FROM ghcr.io/void-linux/void-glibc-full:latest

# Switch to root user for system updates
USER root

# Combine system updates, installation, and user setup in one RUN command
RUN xbps-install -Syu && \
    xbps-install -y sudo base-devel clang lldb llvm fish git binutils ncurses libelf openssl perl rsync tar xz zstd
    
RUN useradd -u 33333 -m -s /usr/bin/fish gitpod && \
    usermod -aG wheel gitpod && \
    echo 'gitpod ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/gitpod

# Set the shell to use fish
SHELL ["fish", "--command"]

# Set the default shell to fish
RUN chsh -s /usr/bin/fish

# Set the environment variable for fish
ENV SHELL /usr/bin/fish

# Set fish as the entrypoint
ENTRYPOINT [ "fish" ]
