# 🚀 **GITHUB ARCHITECTURE FOR LINUX DEVOPS ROADMAP**

*(Copy & Paste directly into your GitHub README or repo)*

```
linux-devops-roadmap/
│
├── README.md
│
├── Level-1-Basic/
│   ├── users-groups.md
│   ├── permissions.md
│   ├── package-management.md
│   └── system-info.md
│
├── Level-2-Intermediate/
│   ├── cron-backups.md
│   ├── automation-scripts.md
│   ├── log-management.md
│   └── monitoring-performance.md
│
├── Level-3-Advanced/
│   ├── systemd-service.md
│   ├── ssh-hardening.md
│   ├── lvm-setup.md
│   ├── firewall-rules.md
│   └── logrotate.md
│
└── linux-commands-cheatsheet/
    ├── file-dirs.md
    ├── networking.md
    ├── process-management.md
    ├── permissions.md
    ├── storage-commands.md
    └── system-commands.md
```

---

# ✅ **NOW — FULL CONTENT OF EACH FILE (FOR YOUR GITHUB REPO)**

Below is **everything**.
Just copy each file into your repo.

---

# 📌 **README.md**

```md
# Linux DevOps Roadmap & Automation Guide

This repository contains a complete roadmap for Linux Server Setup & DevOps Automation.  
It includes:

- Level 1 – Basic Linux Admin
- Level 2 – Intermediate DevOps Tasks
- Level 3 – Advanced Production Linux
- Additional Linux Command CheatSheets

Each document includes detailed commands, best practices, and real-world DevOps workflows.
```

---

# ============================

# **LEVEL 1 – BASIC**

# ============================

# 📁 **users-groups.md**

```md
# User & Group Management

## Create User
sudo useradd devuser
sudo passwd devuser

## Create Group
sudo groupadd devteam

## Add User to Group
sudo usermod -aG devteam devuser

## Verify
id devuser
groups devuser

## Delete User
sudo userdel devuser

## Delete Group
sudo groupdel devteam
```

---

# 📁 **permissions.md**

```md
# Linux File Permissions & Ownership

## Change Owner
sudo chown user:group file

## Change Permissions
chmod 755 file
chmod -R 770 /opt/project

## Permission Notation:
r = read
w = write
x = execute

## Set SGID
sudo chmod g+s /opt/project

## Set Sticky Bit
sudo chmod +t /shared-folder
```

---

# 📁 **package-management.md**

```md
# Package Installation

## Update System
sudo apt update && sudo apt upgrade -y
sudo yum update -y

## Install Git
sudo apt install git -y
sudo yum install git -y

## Install Nginx
sudo apt install nginx -y
sudo systemctl enable --now nginx

## Install Java
sudo apt install openjdk-17-jdk -y
sudo yum install java-17-amazon-corretto -y
```

---

# 📁 **system-info.md**

```md
# System Information Commands

## CPU Info
lscpu

## Memory
free -h

## Disk Usage
df -h

## Partition Info
lsblk

## System Details
cat /etc/os-release
uname -a
```

---

# ============================

# **LEVEL 2 – INTERMEDIATE**

# ============================

# 📁 **cron-backups.md**

```md
# Automate Backups with Cron

## Edit crontab
crontab -e

## Backup at 2 AM daily
0 2 * * * tar -czf /backup/app_$(date +\%F).tgz /opt/app

## List Cron Jobs
crontab -l
```

---

# 📁 **automation-scripts.md**

```md
# Shell Automation Scripts

## Log Cleanup Script
#!/bin/bash
find /var/log -type f -mtime +7 -delete

## Restart Service Script
#!/bin/bash
systemctl restart nginx

## Health Check Script
if systemctl is-active nginx; then
  echo "Running"
else
  echo "DOWN"
fi
```

---

# 📁 **log-management.md**

```md
# Log Management

## View Logs
tail -f /var/log/syslog
tail -f /var/log/messages

## Journal Logs
journalctl -xe
journalctl -u nginx

## Clear Logs
sudo truncate -s 0 /var/log/syslog
```

---

# 📁 **monitoring-performance.md**

```md
# Monitoring & Troubleshooting

## CPU Load
top
htop

## Memory
free -h

## Network Monitoring
iftop
ip -s link

## Service Debugging
systemctl status nginx
journalctl -u nginx
```

---

# ============================

# **LEVEL 3 – ADVANCED**

# ============================

# 📁 **systemd-service.md**

```md
# Custom Systemd Service

## Create Service
sudo nano /etc/systemd/system/myapp.service

[Unit]
Description=My App
After=network.target

[Service]
ExecStart=/usr/bin/java -jar /opt/myapp/app.jar
Restart=on-failure

[Install]
WantedBy=multi-user.target

## Enable & Start
sudo systemctl daemon-reload
sudo systemctl enable myapp
sudo systemctl start myapp
```

---

# 📁 **ssh-hardening.md**

```md
# SSH Security Hardening

## Edit SSH Config
sudo nano /etc/ssh/sshd_config

Disable Root Login:
PermitRootLogin no

Disable Password Login:
PasswordAuthentication no

Allow Specific Users:
AllowUsers devuser

## Restart SSH
sudo systemctl restart sshd
```

---

# 📁 **lvm-setup.md**

```md
# LVM Setup

## Create PV
sudo pvcreate /dev/xvdb

## Create VG
sudo vgcreate appvg /dev/xvdb

## Create LV
sudo lvcreate -L 10G -n applv appvg

## Format
sudo mkfs.ext4 /dev/appvg/applv

## Mount
sudo mount /dev/appvg/applv /mnt/appdata
```

---

# 📁 **firewall-rules.md**

```md
# Firewall Configuration

## UFW
sudo ufw enable
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 443

## Firewalld
sudo firewall-cmd --add-port=8080/tcp --permanent
sudo firewall-cmd --reload
```

---

# 📁 **logrotate.md**

```md
# Logrotate Setup

## Create Rule
sudo nano /etc/logrotate.d/myapp

/opt/myapp/logs/*.log {
    daily
    rotate 7
    compress
    missingok
    notifempty
    copytruncate
}

## Test
sudo logrotate -d /etc/logrotate.d/myapp
```

---

# ============================

# **LINUX COMMANDS CHEATSHEET**

# ============================

# 📁 **file-dirs.md**

```md
# File & Directory Commands

ls -l
ls -lh
cd /path
pwd
mkdir dirname
rm file
rm -rf folder
cp file1 file2
mv file1 file2
```

---

# 📁 **networking.md**

```md
# Networking Commands

ip a
ifconfig
ping google.com
netstat -tulnp
ss -tulnp
curl http://localhost
wget URL
```

---

# 📁 **process-management.md**

```md
# Process Management

ps aux
top
htop
kill PID
kill -9 PID
systemctl status service
systemctl restart service
```

---

# 📁 **permissions.md**

```md
chmod 755 file
chmod -R 770 dir
chown user:group file
setfacl -m u:user:rwx file
getfacl file
```

---

# 📁 **storage-commands.md**

```md
df -h
du -sh *
lsblk
fdisk -l
mount
umount
```

---

# 📁 **system-commands.md**

```md
hostname
uptime
uname -a
cat /etc/os-release
free -h
