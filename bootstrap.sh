#!/bin/bash
set -e

REPO_URL="https://github.com/vladkrutov/cloud-bootstrap.git"
CLONE_DIR="/opt/cloud-bootstrap"

echo "🔄 Updating the system..."
dnf update -y
dnf upgrade -y

echo "📦 Installing required packages..."
dnf install -y epel-release curl sudo python3 python3-pip python3-venv git

echo "🚀 Installing Ansible..."
pip3 install --break-system-packages --upgrade pip
pip3 install ansible

# Clone repo if not already cloned
if [ ! -d "$CLONE_DIR" ]; then
  echo "⬇️ Cloning cloud-bootstrap repo to $CLONE_DIR..."
  git clone "$REPO_URL" "$CLONE_DIR"
else
  echo "🔁 Updating existing clone..."
  git -C "$CLONE_DIR" pull
fi

cd "$CLONE_DIR"

echo "🚀 Running Ansible playbook (apply mode)..."
ansible-playbook --inventory localhost, --connection=local ansible/bootstrap.yml

echo "✅ Done."