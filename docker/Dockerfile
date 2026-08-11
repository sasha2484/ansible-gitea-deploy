# Базовый образ Debian 13 (Trixie)
FROM debian:13-slim

# Установка переменных окружения для неинтерактивной установки
ENV DEBIAN_FRONTEND=noninteractive

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

# Устанавливаем только необходимые Python пакеты через pip
# docker-compose не устанавливаем - используем бинарный файл или плагин
RUN pip3 install --no-cache-dir --break-system-packages \
    docker

# Устанавливаем Docker Compose V2 (плагин) из официального репозитория
# Docker Compose V2 уже входит в состав Docker CE
# Но для работы с ansible коллекцией community.docker нужна совместимость

# Установка Docker Compose отдельным бинарным файлом (рекомендуемый способ)
RUN curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

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