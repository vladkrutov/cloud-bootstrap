#!/bin/bash
set -euo pipefail

REPO_URL="https://github.com/vladkrutov/cloud-bootstrap.git"
CLONE_DIR="/opt/cloud-bootstrap"

if [[ $EUID -ne 0 ]]; then
  echo "✋ Please run this script as root (sudo)"; exit 1
fi

mkdir -p /opt

echo "🔄 Updating the system..."
dnf update -y
dnf upgrade -y

echo "📦 Installing required packages..."
dnf install -y epel-release curl sudo python3 python3-pip git

echo "🚀 Installing Ansible..."
dnf install -y ansible-core

# Clone repo if not already cloned
if [ ! -d "$CLONE_DIR" ]; then
  echo "⬇️ Cloning cloud-bootstrap repository to $CLONE_DIR..."
  git clone "$REPO_URL" "$CLONE_DIR"
else
  echo "🔁 Updating existing repository clone..."
  git -C "$CLONE_DIR" pull --ff-only
fi

cd "$CLONE_DIR"

if [[ ! -f ansible/bootstrap.yml ]]; then
  echo "❌ ansible/bootstrap.yml not found in $CLONE_DIR"; exit 1
fi

echo "🚀 Running Ansible playbook (apply mode)..."
ansible-playbook --inventory localhost, --connection=local ansible/bootstrap.yml

echo "✅ Done."