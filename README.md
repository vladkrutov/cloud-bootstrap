# ☁️ Cloud Bootstrap

[![Ansible](https://img.shields.io/badge/Ansible-ready-blue?logo=ansible)](https://www.ansible.com/)
[![Docker](https://img.shields.io/badge/Docker-included-blue?logo=docker)]()
[![AlmaLinux](https://img.shields.io/badge/AlmaLinux-8%2F9-blueviolet?logo=redhat)]()
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)

A clean and repeatable bootstrap setup for AlmaLinux servers using Ansible.  
Includes Webmin, Docker Engine, Docker Compose, and Jenkins in a container.  
The bootstrap now supports AlmaLinux 8/9, includes root privilege checks, safe bash execution mode, and verifies required files before running.

---

## 🚀 Quick Start

```bash
curl -sSL https://raw.githubusercontent.com/vladkrutov/cloud-bootstrap/main/bootstrap.sh | bash
```

> **Note:** The script must be run as root (sudo). Ensure that `curl` and `git` are installed before running.

---

## 🔧 What’s Installed

| Component | Description |
|----------|-------------|
| Webmin   | Admin panel on `https://<host>:10000` |
| Docker + Compose | Docker Engine and Docker Compose plugin |
| Jenkins  | CI/CD server running in Docker |

---

## 📦 Project Structure

```
cloud-bootstrap/
├── bootstrap.sh
├── LICENSE
├── README.md
└── ansible/
    ├── bootstrap.yml
    └── inventory.ini
```

---

## 🛡 Notes

- firewalld is enabled and configured to allow required ports; script checks for root privileges and missing files before running
- Webmin runs on the host; Jenkins runs in Docker
- Nginx/SSL can be added later as a separate step
- The script uses `set -euo pipefail` for safer execution and `git pull --ff-only` to avoid merge conflicts
