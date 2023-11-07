# Use a Fedora base image
FROM voidlinux:voidlinux

# user
USER root

RUN xbps-reconfigure -a && xbps-install -uy xbps \
    && xbps-install -syu \
    && xbps-install -sy sudoers \
    && rm -r /var/cache/xbps

RUN useradd -l -u 33333 -G wheel -md /home/gitpod -s /bin/bash -p gitpod gitpod \
    && sed -i.bkp -e 's/%wheel\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%wheel ALL=NOPASSWD:ALL/g' /etc/sudoers
