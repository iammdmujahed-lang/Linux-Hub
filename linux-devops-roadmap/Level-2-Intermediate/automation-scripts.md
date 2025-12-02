# Shell Automation Scripts

## Log Cleanup Script
#!/bin/bash
find /var/log -type f -mtime +7 -delete
echo old logs cleared.

## Restart Service Script
#!/bin/bash
systemctl restart nginx

## Health Check Script
#!/bin/bash
if systemctl is-active nginx; then
  echo "Running"
else
  echo "DOWN"
fi
