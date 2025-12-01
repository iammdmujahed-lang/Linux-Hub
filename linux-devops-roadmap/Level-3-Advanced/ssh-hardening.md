# SSH Security Hardening

## Edit SSH Config
sudo nano /etc/ssh/sshd_config

PermitRootLogin no
PasswordAuthentication no
AllowUsers devuser

## Restart SSH
sudo systemctl restart sshd
