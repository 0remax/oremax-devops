# Oremax Innovations: DevOps Engineering Lab
### Targeted Role: Junior DevOps / System Administrator

This repository serves as a technical log of my transition into DevOps Engineering. It documents the deployment, security hardening, and automation of a Linux-based infrastructure.

## 🛠 Tech Stack
* **OS:** Ubuntu 24.04 LTS (Headless)
* **Web Server:** Nginx
* **Security:** UFW, SSH Hardening
* **Version Control:** Git / GitHub
* **Automation:** Bash Scripting & Cron

---

## 📈 Milestone Log

### Day 1: Environment & Terminal Mastery
* **Objective:** Provision a stable Linux environment and master CLI navigation.
* **Key Tasks:** * Configured VirtualBox with Ubuntu 24.04.
  * Mastered absolute/relative paths and file permissions (`chmod`, `chown`).
  * Implemented log monitoring using `tail -f` and `grep` for real-time troubleshooting.

### Day 2: Configuration & Networking
* **Objective:** Deploy web services and establish secure remote access.
* **Key Tasks:**
  * Deployed a production-ready **Nginx** web server.
  * Established a **Secure Shell (SSH)** tunnel from a Windows host.
  * Implemented a **UFW Firewall** policy (Allowing only Ports 80, 443, and 2222).
  * Resolved DNS resolution conflicts by modifying `systemd-resolved` configurations.

### Day 3: Automation & Persistence
* **Objective:** Remove manual toil through scripting and task scheduling.
* **Key Tasks:**
  * Developed a **Bash Script** (`backup.sh`) to automate compressed archives of web directories.
  * Scheduled recurring maintenance using **Crontab**.
  * Implemented **tmux** for session persistence during remote administration.

---

## 📂 Project Structure
* `/scripts`: Automation utilities and maintenance scripts.
* `/configs`: Hardened configuration files for Nginx and SSH.
* `/documentation`: Technical write-ups and architectural diagrams.
