#!/usr/bin/env bash
set -euo pipefail

if [ $EUID -ne 0 ]; then echo "Please run as root (sudo ./bootstrap.sh)"; exit 1; fi

dnf -y update
DNF_PKGS=(epel-release git ansible-core firewalld python3-pip python3-venv)
dnf -y install "${DNF_PKGS[@]}" || true
python3 -m pip install --upgrade pip --break-system-packages || true
systemctl enable --now firewalld

ansible-galaxy install -r ansible/requirements.yml

if [ ! -f ansible/group_vars/all.yml ]; then
  echo "✗ Missing ansible/group_vars/all.yml"; echo "  → cp ansible/group_vars/all.yml.sample ansible/group_vars/all.yml && edit values"; exit 2
fi
if [ ! -f ansible/vault.yml ]; then
  echo "⚠ ansible/vault.yml not found — proceeding without secrets."; fi

ansible-playbook ansible/site.yml --inventory localhost, --connection=local

echo "✓ Done."