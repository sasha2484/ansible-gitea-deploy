# Ansible Gitea Deployment

Развертывание Gitea в Docker на Debian 13 с использованием Ansible.

## 📋 Требования

- Docker и Docker Compose установлены на системе сборки
- Доступ по SSH к целевым серверам
- Debian 13 (Trixie) на целевых серверах

## 🚀 Быстрый старт

### 1. Сборка Docker-образа с Ansible

```bash
# Даем права на выполнение
chmod +x scripts/build-ansible-image.sh

# Собираем образ
./scripts/build-ansible-image.sh