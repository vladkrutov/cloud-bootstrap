# ☁️ Cloud Bootstrap

[![Ansible](https://img.shields.io/badge/Ansible-ready-blue?logo=ansible)](https://www.ansible.com/)
[![Docker](https://img.shields.io/badge/Docker-included-blue?logo=docker)]
[![AlmaLinux](https://img.shields.io/badge/AlmaLinux-8%2F9-blueviolet?logo=redhat)]
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)

A clean and repeatable bootstrap setup for AlmaLinux servers using Ansible.  
Includes Webmin, Docker Engine, Docker Compose, and Jenkins in a container.

---

## 🚀 Quick Start

```bash
curl -sSL https://raw.githubusercontent.com/vladkrutov/cloud-bootstrap/main/bootstrap.sh | bash
ansible-playbook -i ansible/inventory.ini ansible/bootstrap.yml
```

---

## 🔧 What’s Installed

| Component | Description |
|----------|-------------|
| Webmin   | Admin panel on `https://<host>:10000` |
| Docker + Compose | Container runtime and plugin |
| Jenkins  | CI server on `http://<host>:8080` |

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

- firewalld is enabled and configured to allow required ports
- Webmin runs on the host; Jenkins runs in Docker
- Nginx/SSL can be added later as a separate step
