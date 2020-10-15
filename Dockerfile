FROM alpine

RUN apk add --no-cache --virtual renode-build-dependencies \
    git \
    build-base \
    cmake \
    autoconf \
    automake \
    libtool \
    python3 \
    gettext-dev \
    curl-dev


ENV MONO_REVISION mono-6.12.0.102
RUN git clone --recursive --branch ${MONO_REVISION} https://github.com/mono/mono.git /mono

WORKDIR /mono
RUN ./autogen.sh --prefix=/opt/mono
RUN make
RUN make install

