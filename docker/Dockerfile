# Базовый образ Debian 13 (Trixie)
FROM debian:13-slim

# Установка переменных окружения для неинтерактивной установки
ENV DEBIAN_FRONTEND=noninteractive
ENV PIP_NO_CACHE_DIR=1
ENV PIP_DISABLE_PIP_VERSION_CHECK=1
ENV PIP_BREAK_SYSTEM_PACKAGES=1

# Установка необходимых пакетов
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

# Установка Python-модулей через pip с разрешением на системную установку
# Используем --break-system-packages для обхода ограничений Debian 13
RUN pip3 install --no-cache-dir --break-system-packages \
    docker \
    docker-compose

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