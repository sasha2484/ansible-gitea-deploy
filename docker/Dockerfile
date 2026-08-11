FROM debian:13-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    python3-full \
    ansible \
    ansible-core \
    git \
    curl \
    wget \
    vim \
    sshpass \
    openssh-client \
    python3-docker \
    python3-yaml \
    python3-jinja2 \
    python3-requests \
    python3-cryptography \
    python3-jmespath \
    python3-netaddr \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir --break-system-packages \
    docker

RUN curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

RUN ansible-galaxy collection install \
    community.docker \
    community.general \
    ansible.posix

WORKDIR /ansible

COPY ansible/ansible.cfg /etc/ansible/ansible.cfg

RUN useradd -m -s /bin/bash ansible && \
    echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ENTRYPOINT ["ansible-playbook"]
CMD ["--version"]