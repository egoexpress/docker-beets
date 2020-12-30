FROM ubuntu:focal

LABEL maintainer "Bjoern Stierand <bjoern-github@innovention.de>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y -qq --no-install-recommends \
      locales \
      python3.9-minimal \
      python3.9-pip \
      python3.9-setuptools \
      vim-tiny && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install beets requests discogs-client
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen && \
    groupadd -g 1000 beets && \
    useradd -r -u 1000 -g beets beets && \
    mkdir -p /beets && \
    mkdir -p /run/beets && \
    chown beets:beets /run/beets && \
    mkdir -p /home/beets/.config/beets && \
    chown beets:beets /home/beets/.config/beets
USER beets

COPY files/config.yaml /home/beets/.config/beets/config.yaml
COPY files/bashrc /home/beets/.bashrc

WORKDIR /beets
