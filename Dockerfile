# Use the Void Linux base image
FROM ghcr.io/void-linux/void-glibc

# Switch to root user for system updates
USER root

# Combine system updates, installation, and user setup in one RUN command
RUN xbps-install -Syu && \
    xbps-install -y sudo shadow base-devel clang lldb llvm git binutils ncurses libelf openssl perl rsync zip unzip lz4 tar xz zstd

# Create user with void-packages tools
RUN useradd -m -g users -G wheel -s /bin/bash -p '*' gitpod && \
    echo 'gitpod ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/gitpod

#RUN useradd -u 33333 -m -g users -G wheel -s /usr/bin/fish -p '*' gitpod && \
#    echo 'gitpod ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/gitpod

# Set the shell to use fish
#SHELL ["fish", "--command"]

# Set the default shell to fish
#RUN chsh -s /usr/bin/fish

# Set the environment variable for fish
#ENV SHELL /usr/bin/fish

# Set fish as the entrypoint
#ENTRYPOINT [ "fish" ]
