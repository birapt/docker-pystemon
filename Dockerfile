FROM ubuntu:16.04.4
MAINTAINER Pedro Goncalves <birapt@gmail.com>

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND  noninteractive 

#  keep things updated
RUN apt-get update && \
apt-get upgrade -y && \
BUILD_PACKAGES="python-pip git" && \
apt-get -y install $BUILD_PACKAGES

# obtain last pystemon version
RUN /bin/bash -c "mkdir -p /servers && \
cd /servers && \
git clone https://github.com/cvandeplas/pystemon.git && \
mkdir -p /servers/pystemon/alerts"

# add specific configs
ADD config/pystemon.yaml /servers/pystemon/pystemon.yaml

# define workdir for script execution
WORKDIR /servers/pystemon/

# define alerts volumes
VOLUME ["/servers/pystemon/alerts"]

# upgrade python packages
RUN pip2 install --upgrade pip
RUN pip2 install --upgrade pymongo
RUN pip2 install --upgrade pyyaml
RUN pip2 install --upgrade BeautifulSoup

# run pystemon
CMD /usr/bin/python /servers/pystemon/pystemon.py -v

