FROM augustash/baseimage:0.9.19
MAINTAINER Pete McWilliams <petemcw@gmail.com>

ENV APTLIST="build-essential ca-certificates git nodejs python python-dev python-pip sqlite" \
    BRANCH="develop"

WORKDIR /app

# install/update packages
RUN /usr/bin/curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN echo 'deb https://deb.nodesource.com/node_6.x xenial main' > /etc/apt/sources.list.d/nodesource.list && \
    echo 'deb-src https://deb.nodesource.com/node_6.x xenial main' >> /etc/apt/sources.list.d/nodesource.list
RUN apt-get -yqq update && \
    apt-get -yqq install $APTLIST && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# add base scripts
COPY confd/ /etc/confd/
COPY init/ /etc/my_init.d/
COPY services/ /etc/service/
RUN  chmod +x /etc/service/*/run /etc/my_init.d/*.sh

# exports
EXPOSE 5000
VOLUME ["/app"]
