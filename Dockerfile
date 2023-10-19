FROM alpine:latest
RUN apk add autoconf automake make curl wget perl
RUN wget https://github.com/ddclient/ddclient/archive/refs/tags/v3.11.0_1.tar.gz
RUN tar xfv v3.11.0_1.tar.gz && \
    cd ddclient-3.11.0_1 && ./autogen && \
     ./configure \
      --prefix=/usr \
      --sysconfdir=/etc/ddclient \
      --localstatedir=/var && \
      make && \
      make VERBOSE=1 check && \
      make install && \
      chmod 600 /etc/ddclient/ddclient.conf
RUN apk del autoconf automake make & rm -fr /v3.11.0.1.tar.gz /ddclient-3.11.0_1
ENTRYPOINT ["ddclient"]

