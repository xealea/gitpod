# from image
FROM fedora:latest

# user
USER root

RUN useradd -s /bin/bash vixel
RUN useradd -l -u 33333 -G wheel -md /home/vixel -s /bin/bash -p vixel vixel \
    && sed -i.bkp -e 's/%wheel\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%wheel ALL=NOPASSWD:ALL/g' /etc/sudoers

RUN dnf install -y dnf-plugins-core git-core \
    && dnf clean all \
    && rm -rf /var/cache/yum

USER vixel
