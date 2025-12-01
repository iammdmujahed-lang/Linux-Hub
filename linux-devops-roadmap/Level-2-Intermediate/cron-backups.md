# Automate Backups with Cron

## Edit Crontab
crontab -e

## Backup at 2 AM daily
0 2 * * * tar -czf /backup/app_$(date +\%F).tgz /opt/app

## List Cron Jobs
crontab -l
