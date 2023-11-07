# from image
FROM alpine:latest

# user
USER root

RUN useradd -l -u 33333 -G wheel -md /home/gitpod -s /bin/bash -p gitpod gitpod \
    && sed -i.bkp -e 's/%wheel\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%wheel ALL=NOPASSWD:ALL/g' /etc/sudoers

RUN apk update && apk upgrade && \
    apk add --no-cache sudo shadow && \
    rm -rf /var/cache/apk/*
