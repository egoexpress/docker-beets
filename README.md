# docker-beets

## Description

Docker image for [beets](http://beets.io), the _media library management system for obsessive-compulsive music geeks_.

This image is used to run beets on an [ODroid-C2](http://www.hardkernel.com/main/products/prdt_info.php?g_code=G145457216438).

## Usage

Use the included _docker-compose_ file to get the Docker containers up and running. Use the following
commands if you want to build the container yourself.

    git clone https://github.com/egoexpress/docker-beets.git
    cd docker-beets
    docker build -t egoexpress/beets .
    docker-compose up -d
    docker exec -it beets /bin/bash
