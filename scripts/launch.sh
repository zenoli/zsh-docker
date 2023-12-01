#!/bin/sh

docker build -t zsh-docker .
docker run \
    -it \
    --rm \
    --mount type=bind,source="$(pwd)/zsh",target=/home/dev/.config/zsh \
    --name zsh-docker \
    zsh-docker

