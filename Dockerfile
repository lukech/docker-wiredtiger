FROM ubuntu:18.04

WORKDIR /app 

RUN apt-get update && apt-get install -y \
	git \
	python \
	python-dev \
	make \
 	autoconf \
 	automake \
 	libtool \
	gcc \
	g++ \
	gawk \ 
	libsnappy-dev \
	zlib1g-dev \
	liblz4-dev \
	swig

RUN git clone https://github.com/wiredtiger/wiredtiger -b develop && \
    cd wiredtiger/build_posix &&  \
    sh reconf && \
    ../configure --enable-python --enable-silent-rules --enable-strict --with-builtins=lz4,snappy,zlib --enable-diagnostic --disable-static && \
    make -j 8

