#!/bin/bash
set -e

REPO_URL="https://github.com/vladkrutov/cloud-bootstrap.git"
CLONE_DIR="/opt/cloud-bootstrap"

echo "🔄 Updating the system..."
dnf update -y

echo "📦 Installing required packages..."
dnf install -y epel-release curl sudo python3 python3-pip git

echo "🚀 Installing Ansible..."
pip3 install --upgrade pip
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

echo
echo "🧪 Ready to run Ansible bootstrap playbook."
echo "Choose an option:"
echo "  [Y] Yes – run playbook (apply changes)"
echo "  [D] Dry run – check mode first"
echo "  [N] No – skip Ansible step"
read -p "Your choice [Y/D/N]: " choice

case "${choice^^}" in
  Y)
    echo "🚀 Running Ansible playbook (apply mode)..."
    ansible-playbook -i ansible/inventory.ini ansible/bootstrap.yml
    ;;
  D)
    echo "🔍 Running Ansible in check mode (dry run)..."
    ansible-playbook -i ansible/inventory.ini ansible/bootstrap.yml --check
    echo
    read -p "Apply the changes now? [Y/N]: " confirm
    if [[ "${confirm^^}" == "Y" ]]; then
      echo "🚀 Running Ansible playbook (apply mode)..."
      ansible-playbook -i ansible/inventory.ini ansible/bootstrap.yml
    else
      echo "❌ Skipped applying changes."
    fi
    ;;
  *)
    echo "❌ Skipped Ansible execution."
    ;;
esac

echo "✅ Done."