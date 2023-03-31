FROM xealea/faster:01

# user
USER root

# make file doas
RUN echo "#permit nopass gitpod as root" >> /etc/doas.d/doas.conf

# package
RUN apk add --no-cache bash shadow fish doas neofetch ccache && \
    useradd -l -u 33333 -G wheel -md /home/gitpod -s /bin/bash -p gitpod gitpod \
    && sed -i.bkp -e 's/#permit nopass gitpod as root/permit nopass gitpod as root/g' /etc/doas.d/doas.conf \
    && chmod 0440 /etc/doas.d/doas.conf

# set shell use fish
RUN chsh -s /bin/bash

# env fish
ENV SHELL /bin/bash

# entrypoint
ENTRYPOINT [ "bash" ]
