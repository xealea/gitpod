# Use the Fedora base image
FROM fedora:latest

# Switch to root user for system updates
USER root

# Combine system updates and user setup in one RUN command
RUN dnf update -y && \
    dnf install -y sudo shadow-utils bc make cmake binutils gcc clang lld lldb llvm fish git binutils ncurses-devel /usr/include/{libelf.h,openssl/pkcs7.h} /usr/bin/{bc,bison,flex,gcc,git,gpg2,gzip,make,openssl,pahole,perl,rsync,tar,xz,zstd} perl bison ccache dwarves elfutils-devel elfutils-libelf-devel fedora-packager fedpkg flex gcc-c++ git grubby libXi-devel lz4 make ncurses-devel openssl openssl-devel perl-devel perl-generators pesign python3-devel qt5-qtbase-devel rpm-build rpmdevtools schedtool zstd rsync -y && \
    dnf clean all

RUN useradd -u 33333 -m gitpod && \
    usermod -aG wheel gitpod && \
    echo 'gitpod ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/gitpod

USER gitpod
