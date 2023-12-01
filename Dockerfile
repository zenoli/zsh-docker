FROM alpine
ENV PACKAGES " \
    curl \
    git \
    vim \
    zsh \
"

RUN apk update && apk add $PACKAGES

# Create user
RUN adduser -D dev
USER dev
WORKDIR /home/dev

ENTRYPOINT /bin/zsh
