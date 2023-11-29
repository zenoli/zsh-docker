FROM alpine
ENV PACKAGES " \
    zsh \
    git \
    vim \
    curl \
"

RUN apk update && apk add $PACKAGES rm -rf /var/cache/apk/*

# Create user
RUN adduser -D dev
USER dev
WORKDIR /home/dev

ENTRYPOINT /bin/zsh
