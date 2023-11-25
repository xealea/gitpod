# Use the NixOS base image
FROM nixos/nix:latest

# Switch to root user for system updates
USER root

# Combine system updates, installation, and user setup in one RUN command
RUN nix-env -u && \
    nix-env -iA nixpkgs.sudo nixpkgs.base-devel nixpkgs.clang nixpkgs.lldb nixpkgs.llvm nixpkgs.fish nixpkgs.git nixpkgs.binutils nixpkgs.ncurses nixpkgs.libelf nixpkgs.openssl nixpkgs.perl nixpkgs.rsync nixpkgs.tar nixpkgs.xz nixpkgs.zstd

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
