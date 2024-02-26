FROM alpine
ENV PACKAGES " \
    bash \
    curl \
    git \
    github-cli \
    lf \
    ncurses \
    neovim \
    perl \
    zsh \
    "

RUN apk update && apk add $PACKAGES

# Create user
RUN adduser -D dev
USER dev
# RUN chown -R dev:dev /home/dev/.config
WORKDIR /home/dev
RUN mkdir /home/dev/.config

ENTRYPOINT /bin/zsh
