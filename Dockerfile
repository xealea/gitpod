# from image
FROM fedora:latest

# user
USER root

RUN useradd -l -u 33333 -G wheel -md /home/gitpod -s /bin/bash -p gitpod gitpod \
    && sed -i.bkp -e 's/%wheel\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%wheel ALL=NOPASSWD:ALL/g' /etc/sudoers

RUN dnf install -y dnf-plugins-core git-core \
    && dnf clean all \
    && rm -rf /var/cache/yum
