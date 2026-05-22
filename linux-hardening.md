# Enterprise Linux Server Optimization & Hardening

### 📋 Scenario Objective
To secure a raw Ubuntu/Debian server instance before exposing it to public traffic, preventing automated brute-force attempts and stabilizing local resource allocation.

### 🛡 Core Automation Blueprint
This shell configuration checklist locks down global root configurations, updates firewalls, and forces high-security secure shell (SSH) key requirements.

```bash
#!/bin/bash
# --- Enterprise Server Initialization Script ---

echo "[+] Updating local system packages..."
sudo apt-get update -y && sudo apt-get upgrade -y

echo "[+] Securing System SSH Configurations..."
# Deactivate direct root logins and block legacy password authentication
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl restart sshd

echo "[+] Instantiating Uncomplicated Firewall (UFW) Parameters..."
# Set default traffic rejection parameters and explicitly allow trusted access ports
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp comment 'Secure SSH Management Access'
sudo ufw allow 80/tcp comment 'HTTP Web Delivery Route'
sudo ufw allow 443/tcp comment 'HTTPS Secure TLS Delivery Route'
sudo ufw --force enable

echo "[+] Initializing Automatic Patch Security Schedule..."
sudo apt-get install unattended-upgrades -y
```
📊 Validation Criteria
Confirm application port blocking behavior by running sudo ufw status verbose.

Audit unauthorized entry vectors globally by tracking authentication anomalies inside /var/log/auth.log.
