FROM debian:stretch

RUN apt-get update && apt-get -y install git curl unzip wget

RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /home/vscodespace
WORKDIR /home/vscodespace

ENV PUB_CACHE=/home/vscodespace/.pub_cache
ENV PATH="/home/vscodespace/flutter/bin:$PATH"

RUN git clone https://github.com/flutter/flutter && \
    /home/vscodespace/flutter/bin/flutter config --enable-web

RUN mkdir android
RUN echo pwd
RUN cd /home/vscodespace/android
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-9123335_latest.zip
RUN unzip commandlinetools-linux-9123335_latest.zip
# RUN mv cmdline-tools android
# RUN cd /home/vscodespace/android/cmdline-tools
# RUN mkdir tools
# RUN mv -i * tools
