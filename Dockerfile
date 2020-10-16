FROM alpine

RUN apk add --no-cache --virtual mono-build-dependencies \
    git \
    build-base \
    cmake \
    autoconf \
    automake \
    libtool \
    python3 \
    linux-headers \
    gettext-dev \
    curl-dev

RUN apk add --no-cache --virtual mono-edge-build-dependencies \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    mono

ENV MONO_REVISION mono-6.12.0.102
RUN git clone --recursive --branch ${MONO_REVISION} https://github.com/mono/mono.git /mono

WORKDIR /mono
RUN ./autogen.sh --prefix=/opt/mono
RUN make
RUN make install

