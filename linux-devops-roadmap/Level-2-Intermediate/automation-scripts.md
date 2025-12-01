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
