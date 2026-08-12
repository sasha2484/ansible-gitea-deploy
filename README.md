# Ansible Gitea Deployment (All in Docker containers)

Развертывание Gitea с Nginx и SSL (Certbot) полностью в Docker-контейнерах на Debian 13.

## Требования

- Docker и Docker Compose на системе сборки
- Доступ по SSH к целевым серверам
- Debian 13  на целевых серверах
- Открытые порты: 80 (HTTP), 443 (HTTPS), 22 

## Сборка Docker-образа с Ansible

```bash
chmod +x scripts/build-ansible-image.sh
./scripts/build-ansible-image.sh
```

## Редактируем inventory файл с IP

```bash
vim ansible/inventory/hosts.yml
```

## Редактируем переменные (пароли!)

```bash
vim roles/gitea/vars/main.yml
```

## Запускаем развертывание

```bash
docker run --rm \
  -v $(pwd):/ansible \
  -v ~/.ssh:/root/.ssh:ro \
  ansible-debian13:latest \
  playbooks/deploy-gitea.yml \
  -i inventory/hosts.yml
```
