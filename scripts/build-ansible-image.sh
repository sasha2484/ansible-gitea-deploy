#!/bin/bash
# Скрипт для сборки Docker-образа с Ansible

set -e

IMAGE_NAME="ansible-debian13"
IMAGE_TAG="latest"
DOCKERFILE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "🔨 Building Docker image: ${IMAGE_NAME}:${IMAGE_TAG}"
echo "📁 Dockerfile path: ${DOCKERFILE_DIR}/docker/Dockerfile"

docker build \
    -t "${IMAGE_NAME}:${IMAGE_TAG}" \
    -f "${DOCKERFILE_DIR}/docker/Dockerfile" \
    "${DOCKERFILE_DIR}"

echo "Docker image built successfully!"
echo ""
echo "Usage examples:"
echo "  # Run playbook directly:"
echo "  docker run --rm -v \$(pwd):/ansible ${IMAGE_NAME}:${IMAGE_TAG} playbooks/deploy-gitea.yml -i inventory/hosts.yml"
echo ""
echo "  # Interactive shell:"
echo "  docker run -it --rm -v \$(pwd):/ansible ${IMAGE_NAME}:${IMAGE_TAG} /bin/bash"