FROM xealea/faster:01

# package
RUN apk add --no-cache bash shadow fish doas neofetch ccache && \
    useradd -l -u 33333 -G wheel -md /home/gitpod -s /usr/bin/fish -p gitpod gitpod \
    && sed -i.bkp -e 's/#permit nopass gitpod as root/permit nopass gitpod as root/g' /etc/doas.conf \
    && chmod 0440 /etc/doas.conf
    
