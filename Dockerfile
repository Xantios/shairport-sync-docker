FROM alpine:edge
MAINTAINER git@xantios.nl

RUN apk -U add\
 git\
 build-base\
 autoconf\
 automake\
 libtool\
 alsa-lib-dev\
 libdaemon-dev\
 popt-dev\
 libressl-dev\
 soxr-dev\
 avahi-dev\
 libconfig-dev

 RUN cd /root && git clone "https://github.com/mikebrady/shairport-sync.git" 

 RUN cd /root/shairport-sync && autoreconf -i -f \
 && ./configure \
        --with-alsa \
        --with-pipe \
        --with-avahi \
        --with-ssl=openssl \
        --with-soxr \
        --with-metadata \
 && make \
 && make install

RUN cd / \
 && apk --purge del \
        git \
        build-base \
        autoconf \
        automake \
        libtool \
        alsa-lib-dev \
        libdaemon-dev \
        popt-dev \
        libressl-dev \
        soxr-dev \
        avahi-dev \
        libconfig-dev \
 && apk add \
        dbus \
        alsa-lib \
        libdaemon \
        popt \
        libressl \
        soxr \
        avahi \
        libconfig \
 && rm -rf \
        /etc/ssl \
        /var/cache/apk/* \
        /lib/apk/db/* \
        /root/shairport-sync

COPY bootstrap.sh /start

ENV AIRPLAY_NAME Docker

ENTRYPOINT [ "/start" ]
