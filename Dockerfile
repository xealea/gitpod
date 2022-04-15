# from image 
FROM vcyzteen/cloud:builder

# setup env
ARG DEBIAN_FRONTEND=noninteractive

# setup package
RUN apt-get update -qq && apt-get upgrade -y

# setup main directory
RUN mkdir -p vcyzteen

# setup workdir
WORKDIR vcyzteen
