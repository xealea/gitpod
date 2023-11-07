# Use a Fedora base image
FROM ghcr.io/void-linux/void-glibc:b51f606@sha256:5d3696a737865fcb6123876a3ca64dc0f523b70f0ab4072553bca2eb3cc07d14 

# user
USER root

RUN xbps-install -uy xbps \
    && xbps-install -syu \
    && xbps-install -sy sudoers

RUN useradd -l -u 33333 -G wheel -md /home/gitpod -s /bin/bash -p gitpod gitpod \
    && sed -i.bkp -e 's/%wheel\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%wheel ALL=NOPASSWD:ALL/g' /etc/sudoers
