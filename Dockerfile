# Use a Fedora base image
FROM fedora:latest

# Install necessary packages
RUN dnf -y update && dnf install -y dnf-plugins-core git sudo && dnf clean all

# Create the "gitpod" group with the correct GID
RUN groupadd -g 33333 gitpod

# Create a non-root user and give it sudo privileges without a password
RUN useradd -m -s /bin/bash -u 33333 -g gitpod vixel \
    && echo "vixel ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Set the working directory
WORKDIR /home/vixel

# Switch to the vixel user
USER vixel

# You can add more configurations or software installations here if needed
