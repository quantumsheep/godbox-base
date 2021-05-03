FROM buildpack-deps:buster as compilers

RUN set -xe && \
    apt-get update && \
    apt-get install -y --no-install-recommends git libcap-dev && \
    rm -rf /var/lib/apt/lists/* && \
    git clone https://github.com/judge0/isolate.git /tmp/isolate && \
    cd /tmp/isolate && \
    git checkout ad39cc4d0fbb577fb545910095c9da5ef8fc9a1a && \
    make -j$(nproc) install && \
    rm -rf /tmp/*

COPY modules modules

RUN bash modules/gcc.sh
RUN bash modules/go.sh
RUN bash modules/nodejs.sh
RUN bash modules/python.sh
RUN bash modules/ruby.sh

CMD /bin/bash
