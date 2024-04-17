#!/usr/bin/env bash

REPO=wjf8882300/v2ray
TAG=5.15.1

docker build -t $REPO:$TAG .
# docker tag $REPO:$TAG $REPO:latest

cert_dir=/data/nginx/cert
mkdir -p ${cert_dir}
docker run -it --rm --name docker-nginx-v2ray \
    -p 80:80 \
    -p 443:443 \
    -p 12345:12345 \
    -v "${cert_dir}":/data/cert \
    -e SITE_DOMAIN=localhost \
    -e V2RAY_TOKEN="00000000-0000-0000-0000-000000000000" \
    $REPO:$TAG
