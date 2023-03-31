FROM xealea/faster:01

# package
RUN apk add --no-cache fish doas neofetch ccache && \
    adduser -D -u 33333 -h /home/gitpod -s /usr/bin/fish gitpod && \
    echo "permit nopass gitpod as root" >> /etc/doas.conf

# shell cmd
SHELL ["fish", "--command"]

# set shell use fish
RUN chsh -s /usr/bin/fish gitpod

# env fish
ENV SHELL /usr/bin/fish

# entrypoint
ENTRYPOINT [ "fish" ]
