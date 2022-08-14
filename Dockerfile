# from image 
FROM xealea/xea:01

# user
USER root

# setup env
ARG DEBIAN_FRONTEND=noninteractive

# use my kernel
RUN wget https://temp.sh/HKjYQ/linux-headers-5.19.1-xea-xo1.deb
RUN wget https://temp.sh/Ujemx/linux-image-5.19.1-xea-xo1.deb
RUN dpkg -i linux-image-*xea*.deb linux-headers-*xea*.deb

# package
RUN apt-get update -qq && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y \
    fish sudo passwd neofetch

# sudo hax
RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /usr/bin/fish -p gitpod gitpod \
    && sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers \
    && chmod 0440 /etc/sudoers

# shell cmd
SHELL ["fish", "--command"]

# set shell use fish
RUN chsh -s /usr/bin/fish

# env fish
ENV SHELL /usr/bin/fish

# entrypoint
ENTRYPOINT [ "fish" ]
