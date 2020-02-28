FROM talkdesk/python:3.5.3
RUN \
    apt-get update -yqq && \
    apt-get install -yqq apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update -yqq && \
    apt-cache madison docker-ce && \
    apt-get install -yqq docker-ce=5:19.03.6~3-0~debian-stretch docker-ce-cli=5:19.03.6~3-0~debian-stretch containerd.io && \
    pip3 install docker-compose && \
    apt-get autoclean && apt-get --purge -y autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
