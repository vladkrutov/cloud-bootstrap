#!/bin/bash
set -e

echo "🔄 Updating the system..."
dnf update -y

echo "📦 Installing required packages..."
dnf install -y epel-release curl sudo python3 python3-pip git firewalld

echo "🚀 Installing Ansible..."
pip3 install --upgrade pip
pip3 install ansible

echo "🔥 Enabling and starting firewalld..."
systemctl enable --now firewalld

echo "✅ Done. You can now run:"
echo ""
echo "  ansible-playbook -i ansible/inventory.ini ansible/bootstrap.yml"
echo ""
