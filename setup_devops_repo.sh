#!/bin/bash

mkdir -p linux-devops-roadmap
cd linux-devops-roadmap

# ---------------------------
# CREATE ROOT README.md
# ---------------------------
cat > README.md << 'EOF'
# Linux DevOps Roadmap & Automation Guide

This repository contains a complete roadmap for Linux Server Setup & DevOps Automation.

## Included Topics:
- Level 1 – Basic Linux Admin
- Level 2 – Intermediate DevOps Tasks
- Level 3 – Advanced Production Linux
- Linux Commands CheatSheets
EOF

# ---------------------------
# LEVEL 1
# ---------------------------
mkdir -p Level-1-Basic

cat > Level-1-Basic/users-groups.md << 'EOF'
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
EOF

cat > Level-1-Basic/permissions.md << 'EOF'
# Linux File Permissions & Ownership

## Change Owner
sudo chown user:group file

## Change Permissions
chmod 755 file
chmod -R 770 /opt/project

## Permission bits:
r = read
w = write
x = execute

## Set SGID
sudo chmod g+s /opt/project

## Set Sticky Bit
sudo chmod +t /shared-folder
EOF

cat > Level-1-Basic/package-management.md << 'EOF'
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
EOF

cat > Level-1-Basic/system-info.md << 'EOF'
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
EOF

# ---------------------------
# LEVEL 2
# ---------------------------
mkdir -p Level-2-Intermediate

cat > Level-2-Intermediate/cron-backups.md << 'EOF'
# Automate Backups with Cron

## Edit Crontab
crontab -e

## Backup at 2 AM daily
0 2 * * * tar -czf /backup/app_$(date +\%F).tgz /opt/app

## List Cron Jobs
crontab -l
EOF

cat > Level-2-Intermediate/automation-scripts.md << 'EOF'
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
EOF

cat > Level-2-Intermediate/log-management.md << 'EOF'
# Log Management

## View Logs
tail -f /var/log/syslog
tail -f /var/log/messages

## Journal Logs
journalctl -xe
journalctl -u nginx

## Clear Logs
sudo truncate -s 0 /var/log/syslog
EOF

cat > Level-2-Intermediate/monitoring-performance.md << 'EOF'
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
EOF

# ---------------------------
# LEVEL 3
# ---------------------------
mkdir -p Level-3-Advanced

cat > Level-3-Advanced/systemd-service.md << 'EOF'
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
EOF

cat > Level-3-Advanced/ssh-hardening.md << 'EOF'
# SSH Security Hardening

## Edit SSH Config
sudo nano /etc/ssh/sshd_config

PermitRootLogin no
PasswordAuthentication no
AllowUsers devuser

## Restart SSH
sudo systemctl restart sshd
EOF

cat > Level-3-Advanced/lvm-setup.md << 'EOF'
# LVM Setup

## Create PV
sudo pvcreate /dev/xvdb

## Create VG
sudo vgcreate appvg /dev/xvdb

## Create LV
sudo lvcreate -L 10G -n applv appvg

## Format LV
sudo mkfs.ext4 /dev/appvg/applv

## Mount
sudo mount /dev/appvg/applv /mnt/appdata
EOF

cat > Level-3-Advanced/firewall-rules.md << 'EOF'
# Firewall Configuration

## UFW (Ubuntu)
sudo ufw enable
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 443

## Firewalld
sudo firewall-cmd --add-port=8080/tcp --permanent
sudo firewall-cmd --reload
EOF

cat > Level-3-Advanced/logrotate.md << 'EOF'
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
EOF

# ---------------------------
# LINUX COMMANDS CHEATSHEET
# ---------------------------
mkdir -p linux-commands-cheatsheet

cat > linux-commands-cheatsheet/file-dirs.md << 'EOF'
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
EOF

cat > linux-commands-cheatsheet/networking.md << 'EOF'
# Networking Commands

ip a
ifconfig
ping google.com
netstat -tulnp
ss -tulnp
curl http://localhost
wget URL
EOF

cat > linux-commands-cheatsheet/process-management.md << 'EOF'
# Process Management

ps aux
top
htop
kill PID
kill -9 PID
systemctl status service
systemctl restart service
EOF

cat > linux-commands-cheatsheet/permissions.md << 'EOF'
chmod 755 file
chmod -R 770 dir
chown user:group file
setfacl -m u:user:rwx file
getfacl file
EOF

cat > linux-commands-cheatsheet/storage-commands.md << 'EOF'
df -h
du -sh *
lsblk
fdisk -l
mount
umount
EOF

cat > linux-commands-cheatsheet/system-commands.md << 'EOF'
hostname
uptime
uname -a
cat /etc/os-release
free -h
journalctl -xe
EOF

echo "✔ All folders and files created successfully!"

