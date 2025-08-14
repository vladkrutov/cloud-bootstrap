# Sample Ansible group variables configuration file
# Copy this file to 'all.yml' and update the values before running the playbook.

# Domain name for your server (e.g., example.com)
domain_name: "your.domain.com"

# Cloudflare API token for DNS management (replace with your token)
cloudflare_api_token: "your_cloudflare_api_token_here"

# Email address used for certificates and notifications
admin_email: "admin@your.domain.com"

# Components to install (set to true to enable, false to disable)
install_webmin: true       # Install Webmin / Virtualmin admin panel
install_apache: false      # Install Apache web server (set false if using Nginx)
install_nginx: true        # Install Nginx web server (set false if using Apache)
install_docker: true       # Install Docker and Docker Compose
install_jenkins: true      # Install Jenkins CI server in Docker container
install_k3d: false         # Install k3d Kubernetes cluster
install_monitoring: true   # Install monitoring stack (VictoriaMetrics + Grafana)
install_vpn: false         # Install optional VPN server

# Additional configuration options can be added below as needed


# Sample Ansible vault variables file
# This file should contain sensitive data encrypted with ansible-vault.
# Copy this file to 'vault.yml' and replace dummy values with your secrets.

# Encrypted Cloudflare API token (example placeholder)
cloudflare_api_token_encrypted: "vault-encrypted-string-placeholder"

# Encrypted password for Webmin admin user
webmin_admin_password_encrypted: "vault-encrypted-string-placeholder"

# Encrypted Jenkins admin password
jenkins_admin_password_encrypted: "vault-encrypted-string-placeholder"

# Encrypted VPN server credentials (if VPN is enabled)
vpn_server_password_encrypted: "vault-encrypted-string-placeholder"

# Add other sensitive variables here as needed, encrypted with ansible-vault
