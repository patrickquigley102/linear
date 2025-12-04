FROM ghcr.io/astral-sh/uv:python3.14-trixie-slim

RUN apt-get update && \
    apt-get upgrade --yes && \
    apt-get install --yes --no-install-recommends \
        ca-certificates \
        build-essential \
        git \
        curl \
        iproute2 \
        procps \
        bash \
        bash-completion \
        zsh \
        nano \
        vim \
        net-tools \
        dnsutils \
        less \
        unzip

RUN echo 'if [ -f /usr/share/bash-completion/bash_completion ]; then . /usr/share/bash-completion/bash_completion; fi' >> /etc/bash.bashrc && \
    mkdir -p /etc/zsh && \
    printf 'autoload -Uz compinit\ncompinit\n' >> /etc/zsh/zshrc

WORKDIR /usr/src/app

COPY . .

ENV VIRTUAL_ENV=/usr/src/app/.venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

EXPOSE 8888

ENV TINI_VERSION=v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]
