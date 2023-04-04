# from image
FROM xealea/faster:01

# switch to root user
USER root

# install packages
RUN apk update && \
    apk upgrade && \
    apk add --no-cache fish neofetch ccache doas && \
    adduser -D -u 33333 gitpod && \
    addgroup gitpod wheel && \
    echo "gitpod ALL=(ALL) NOPASSWD: ALL" > /etc/doas.conf

# switch to gitpod user
USER gitpod

# set default shell to fish
SHELL ["fish", "--version"]

# set fish as the default shell
RUN chsh -s /usr/bin/fish gitpod

# set SHELL environment variable
ENV SHELL /usr/bin/fish

# set entrypoint
ENTRYPOINT ["fish"]
