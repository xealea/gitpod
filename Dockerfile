# Use the Void Linux base image
FROM xealea/void:latest

# Switch to root user for system updates
USER root

# Combine system updates, installation, and user setup in one RUN command
RUN xbps-install -Syu bash libstdc++ gcc clang binutils lldb void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree
