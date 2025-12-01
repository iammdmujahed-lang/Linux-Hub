# Firewall Configuration

## UFW (Ubuntu)
sudo ufw enable
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 443

## Firewalld
sudo firewall-cmd --add-port=8080/tcp --permanent
sudo firewall-cmd --reload
