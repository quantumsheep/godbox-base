FROM buildpack-deps:buster as compilers

COPY dependencies dependencies

RUN bash dependencies/tools.sh
RUN bash dependencies/isolate.sh
RUN bash dependencies/perf.sh
RUN rm -rf dependencies

COPY modules modules

RUN bash modules/gcc.sh
RUN bash modules/go.sh
RUN bash modules/nodejs.sh
RUN bash modules/python.sh
RUN bash modules/ruby.sh
RUN bash modules/rust.sh
RUN rm -rf modules
