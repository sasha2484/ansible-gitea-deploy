# Ansible Gitea Deployment (All in Docker containers)

Развертывание Gitea с Nginx и SSL (Certbot) полностью в Docker-контейнерах на Debian 13.

## Требования

- Docker и Docker Compose на системе сборки
- Доступ по SSH к целевым серверам
- Debian 13 (Trixie) на целевых серверах
- Открытые порты: 80 (HTTP), 443 (HTTPS)

## Сборка Docker-образа с Ansible

```bash
chmod +x scripts/build-ansible-image.sh
./scripts/build-ansible-image.sh