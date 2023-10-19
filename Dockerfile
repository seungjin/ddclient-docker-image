FROM alpine:latest

ARG ddclient_ver=3.11.0_1

RUN apk add autoconf automake make curl wget perl
RUN wget -O /tmp/ddclient.tar.gz https://github.com/ddclient/ddclient/archive/refs/tags/v$ddclient_ver.tar.gz
RUN tar xf /tmp/ddclient.tar.gz -C /tmp && \
    cd /tmp/ddclient-$ddclient_ver && ./autogen && \
     ./configure \
      --prefix=/usr \
      --sysconfdir=/etc/ddclient \
      --localstatedir=/var && \
      make && \
      make VERBOSE=1 check && \
      make install && \
      chmod 600 /etc/ddclient/ddclient.conf
RUN apk del autoconf automake make && apk cache clean && rm -fr /tmp/*
ENTRYPOINT ["ddclient"]

