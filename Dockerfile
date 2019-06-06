FROM ubuntu
MAINTAINER wind <qwind.365@gmail.com>

RUN apt-get update \
        && apt-get install -y --no-install-recommends build-essential libsodium-dev \
        && apt-get install -y shadowsocks-libev

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 8388
ENV PASSWORD 123456
ENV METHOD aes-256-cfb
ENV TIMEOUT 300

USER root

CMD exec ss-server \
     -s $SERVER_ADDR \
     -p $SERVER_PORT \
     -k $PASSWORD \
     -m $METHOD \
     -t $TIMEOUT
