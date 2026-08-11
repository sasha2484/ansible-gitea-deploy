# Базовый образ Debian 13 (Trixie)
FROM debian:13-slim

# Установка переменных окружения для неинтерактивной установки
ENV DEBIAN_FRONTEND=noninteractive
ENV PIP_NO_CACHE_DIR=1
ENV PIP_DISABLE_PIP_VERSION_CHECK=1

# Установка необходимых пакетов
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    ansible \
    ansible-core \
    git \
    curl \
    wget \
    vim \
    sshpass \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*

# Установка Python-модулей для Ansible
RUN pip3 install --no-cache-dir \
    docker \
    docker-compose \
    jmespath \
    netaddr \
    pyyaml \
    jinja2 \
    requests \
    cryptography

# Установка коллекций Ansible
RUN ansible-galaxy collection install \
    community.docker \
    community.general \
    ansible.posix

# Создание рабочей директории
WORKDIR /ansible

# Копирование конфигурации Ansible
COPY ansible/ansible.cfg /etc/ansible/ansible.cfg

# Создание пользователя ansible (опционально)
RUN useradd -m -s /bin/bash ansible && \
    echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Точка входа
ENTRYPOINT ["ansible-playbook"]
CMD ["--version"]