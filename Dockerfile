# Use a Fedora base image
FROM ghcr.io/void-linux/void-glibc 

# user
USER root

RUN xbps-install -uy xbps \
    && xbps-install -syu \
    && xbps-install -sy sudoers

RUN useradd -l -u 33333 -G wheel -md /home/gitpod -s /bin/bash -p gitpod gitpod \
    && sed -i.bkp -e 's/%wheel\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%wheel ALL=NOPASSWD:ALL/g' /etc/sudoers
