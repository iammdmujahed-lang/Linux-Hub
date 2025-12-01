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
