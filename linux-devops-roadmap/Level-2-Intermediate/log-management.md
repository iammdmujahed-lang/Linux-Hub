# Log Management

## View Logs
tail -f /var/log/syslog
tail -f /var/log/messages

## Journal Logs
journalctl -xe
journalctl -u nginx

## Clear Logs
sudo truncate -s 0 /var/log/syslog
